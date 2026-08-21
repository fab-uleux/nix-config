{ ... }:

{
  home.stateVersion = "26.05";

  imports = [
    ./home/common.nix
    ./home/desktop.nix
  ];
}
