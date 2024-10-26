{ pkgs, ... }:
{
  programs.vscode = {
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "copilot-nightly";
        publisher = "github";
        version = "1.67.7949";
        sha256 = "sha256-ZtUqQeWjXmTz49DUeYkuqSTdVHRC8OfgWv8fuhlHDVc=";
      }
    ];
    keybindings = [ ];
    userSettings = { };
  };
}
