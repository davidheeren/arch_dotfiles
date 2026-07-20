
# My personal config files for arch linux

## Dependencies

- gnu stow
- matugen

## Apps

- hyprland
- hyprpaper
- hyprsunset
- hyprlock
- waybar
- wofi
- kitty
- dunst
- tmux
- keyd
- cliphist
- imv
- neovim
- lf

## Sources
- noctalia shell for some templates and colorschemes

## Links
- https://github.com/tinted-theming/base16-gtk-flatcolor

## Notes
- does not stow /etc files by default; manually copy those
- ln -s ~/.zen/your_profile/chrome ~/.config/zen_custom/userChrome.css

### Hyprbind
- wget https://github.com/ry2x/HyprBind/releases/download/v0.1.4/hyprbind-0.1.4-1-x86_64.pkg.tar.zst
- sudo pacman -U hyprbind-0.1.4-1-x86_64.pkg.tar.zst
