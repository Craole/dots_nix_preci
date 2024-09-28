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
      args = {
        inherit flakePath inputs;
      };
    in
    {
      nixosConfigurations = {
        preci = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./core/configurations/preci
            home-manager.nixosModules.home-manager
            {
              # home-manager.backupFileExtension = "bac";
              # home-manager.useGlobalPkgs = true;
              # home-manager.useUserPackages = true;
              # home-manager.users.craole.imports = [
              #   ./home/configurations/craole
              # ];

              # home-manager.extraSpecialArgs = {
              #   inherit args;
              # };
              home-manager = {
                backupFileExtension = "bac";
                useGlobalPkgs = true;
                useUserPackages = true;
                users.craole.imports = [
                  ./home/configurations/craole
                ];

                extraSpecialArgs = {
                  inherit args;
                };
              };
            }
          ];
          specialArgs = {
            inherit args;
          };
        };
      };
    };
}
