{ pkgs, inputs, ... }:

{
  # Shared packages for all machines
  home.packages = with pkgs; [

    # CLI utilis
    alacritty
    git
    btop
    curl
    wget
    vim
    neovim
    tree
    tmux
    rsync
    openssh
    yazi    

    # C / C++
    gcc
    gnumake

    # Java / JetBrains
    jdk21
    jetbrains.idea

    # JavaScript / TypeScript
    typescript

    # Browsers
    vivaldi
    tor-browser
  ];

  # System information display
  imports = [
    inputs.areofyl-fetch.homeManagerModules.default
  ];

  programs.fetch = {
    enable = true;

    labelColor = "red";

    info = [
      "host"
      "kernel"
      "uptime"
      "packages"
      "shell"
      "display"
      "wm"
      "theme"
      "icons"
      "font"
      "terminal"
      "cpu"
      "gpu"
      "memory"
      "swap"
      "disk"
      "ip"
      "battery"
      "locale"
      "colors"
    ];

    speed = 1.0;
    spin = "y";
  };
}
