
return function(main_mod, playerctl_cmd)
    hl.bind(main_mod .. " + XF86AudioNext", hl.dsp.exec_cmd(playerctl_cmd .. " play-pause"), { locked = true, description = "Play/Pause media" })
    hl.bind(main_mod .. " + XF86AudioPrev", hl.dsp.exec_cmd(playerctl_cmd .. " play-pause"), { locked = true, description = "Play/Pause media" })
    hl.bind(main_mod .. " + XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, description = "Toggle mute audio output" })
    hl.bind(main_mod .. " + XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, description = "Toggle mute audio output" })
end
