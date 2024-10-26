{
  description = "NixOS Configuration Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      flakePath = "$HOME/.dots";
      flake = builtins.getEnv "PWD";
    in
    # dlib = import "${flakePath}/lib";
    {
      nixosConfigurations = {
        preci = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./core/libraries
            ./core/configurations/preci
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                backupFileExtension = "bac";
                extraSpecialArgs = {
                  inherit inputs flakePath;
                };
                useGlobalPkgs = true;
                useUserPackages = true;
                users.craole.imports = [
                  ./home/configurations/craole
                ];
              };
            }
          ];
          specialArgs = {
            inherit
              inputs
              flakePath
              flake
              ;
          };
        };
      };
    };
}
