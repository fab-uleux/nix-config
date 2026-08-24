 { config, pkgs, ... }:

{
  imports = [
    ../hardware-config.nix
    ./common-config.nix
  ];

  # Hostname
  networking.hostName = "terra";

  # Bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  # Required for Btrfs subvolumes
  boot.loader.grub.fsIdentifier = "provided";

  # KDE Plasma / Wayland
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  
  # Hardware
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  # Local AI / Ollama
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;

    loadModels = [
      "devstral-small-2"
    ];
  };

}

