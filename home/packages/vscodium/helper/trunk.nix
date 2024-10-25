{ pkgs, ... }:
{
  programs.vscode = {
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        # TODO: Figure how to get to work on nix
        name = "io";
        publisher = "trunk";
        version = "3.13.4";
        sha256 = "sha256-DBH7Vz6L9IgiC+RZjx0isws3BHYbtk0itmQpLH2nrn0=";
      }
    ];
    keybindings = [ ];
    userSettings = { };
  };
}
