{ pkgs, ... }:

{
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    # Window manager / X11
    i3
    dmenu
    dunst

    # Laptop specific
    brightnessctl
    playerctl
    pamixer
    xclip
    xrandr

    # Network
    impala
    bluetui

    # Media
    mpv
  ];
}
