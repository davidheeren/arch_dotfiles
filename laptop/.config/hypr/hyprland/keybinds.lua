
return function(main_mod, playerctl_cmd)
    hl.bind(main_mod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd(playerctl_cmd .. " play-pause"), { locked = true })
    hl.bind(main_mod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd(playerctl_cmd .. " play-pause"), { locked = true })
end
