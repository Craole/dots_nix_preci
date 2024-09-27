{
  description = "Temporary Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{self, nixpkgs, home-manager, ... }: {
      nixosConfigurations = {
        hostname = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./core/configurations/preci.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.craole.imports = [
                ./home/configurations/craole.nix
              ];
  
              home-manager.extraSpecialArgs = {
                inherit inputs self;
              };
            }
          ];
        };
      };
    };
  }
