local EXTERNAL = "HDMI-A-1"
local INTERNAL = "eDP-1"

local function apply_layout(external_connected)
    if external_connected then
        -- Mirror external
        hl.monitor({
            output   = INTERNAL,
            mode     = "preferred",
            position = "auto",
            scale    = 1,
            mirror   = EXTERNAL,
        })
        hl.monitor({
            output   = EXTERNAL,
            mode     = "preferred",
            position = "auto",
            scale    = 1.25,
        })
    else
        -- Main only
        hl.monitor({
            output   = "eDP-1",
            mode     = "1920x1080@60",
            position = "auto",
            scale    = 1.25,
            mirror   = "",
        })
    end
end

-- Removing the HDMI makes all the workspaces in an unknown state
-- this also breaks waybar
local function recover()
    for id = 1, 10 do
        hl.dispatch(hl.dsp.workspace.move({ workspace = tostring(id), monitor = INTERNAL }))
    end
    hl.exec_cmd("~/bin/process-restart waybar")
end

-- Initial state at startup / reload
apply_layout(hl.get_monitor(EXTERNAL) ~= nil)

-- React to added
hl.on("monitor.added", function(m)
    if m.name == EXTERNAL then
        apply_layout(true)
        recover()
    end
end)

-- React to added
hl.on("monitor.removed", function(m)
    if m.name == EXTERNAL then
        apply_layout(false)
        hl.timer(function() recover() end,
            { timeout = 500, type = "oneshot" })
    end
end)
