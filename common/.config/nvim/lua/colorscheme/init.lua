local function load_scheme()
    -- package.loaded["colorscheme.scheme"] = nil
    -- package.loaded["colorscheme.palette_local"] = nil
    require("colorscheme.scheme").load()
end

load_scheme()

-- NOTE: tried to watch file to hot reload the colorscheme but getting errors plus mutliple
--     : set file change events
-- Reverting to watching the file path directly, as this was working for you.
-- local palette_path = vim.fn.fnamemodify("./palette_local.lua", ":p")
--
-- local w = vim.uv.new_fs_event()
-- w:start(palette_path, {}, function(err, filename, events)
--     if err then
--         vim.schedule(function() print("Watcher error: " .. err) end)
--         return
--     end
--
--     vim.schedule(function()
--         -- The event fired for the watched file, so we can just reload.
--         print("Palette changed")
--         -- load_scheme()
--     end)
-- end)
