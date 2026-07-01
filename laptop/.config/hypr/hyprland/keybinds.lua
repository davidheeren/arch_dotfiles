
return function(main_mod, playerctl_cmd)
    hl.bind(main_mod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd(playerctl_cmd .. " next"), { locked = true, description = "Play media next" })
    hl.bind(main_mod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd(playerctl_cmd .. " previous"), { locked = true, description = "Play media previous" })
end
