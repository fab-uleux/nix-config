{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    areofyl-fetch.url = "github:areofyl/fetch";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      terra = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./terra-configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              users.fabulous = import ./home.nix;

              backupFileExtension = "backup";

              extraSpecialArgs = {
                inherit inputs;
              };
            };
          }
        ];
      };

      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./laptop-configuration.nix

          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              users.fabulous = import ./home/laptop.nix;

              backupFileExtension = "backup";

              extraSpecialArgs = {
                inherit inputs;
              };
            };
          }
        ];
      };
    };
  };
}

