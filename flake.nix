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
      flakePath = builtins.toString ./.;
      currentFileInfo = __curPos;
      currentFilePath = currentFileInfo.file;
      currentDir = builtins.dirOf currentFilePath;
      flakePath = currentDir;
    in
    {
      nixosConfigurations = {
        preci = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./core/configurations/preci
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                backupFileExtension = "bac";
                extraSpecialArgs = {
                  inherit inputs;
                };
                useGlobalPkgs = true;
                useUserPackages = true;
                users.craole.imports = [
                  ./home/configurations/craole
                ];
              };
            }
          ];
          extraArgs = {
            inherit inputs flakePath;
          };
        };
      };
    };
}
