{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop";

  time.timeZone = "America/Toronto";

  services.xserver.enable = true;

  services.xserver.windowManager.i3.enable = true;

  services.displayManager = {
    defaultSession = "none+i3";
  };

  services.xserver.displayManager.lightdm.enable = true;

  users.users.fabulous = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  environment.systemPackages = with pkgs; [
    git
  ];

  system.stateVersion = "25.11";
}
