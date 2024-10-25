{ pkgs, ... }:
{
  programs.vscode = {
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        # TODO: Figure how to get this to authenticate
        name = "codeium";
        publisher = "codeium";
        version = "1.6.22";
        sha256 = "sha256-xfE/aV27z0qinPb/kKCW/Dlv0WiHrLn4P7npaedle9g=";
      }
    ];
    keybindings = [ ];
    userSettings = {
      codeium = {
        enableConfig = {
          "*" = true;
        };
        enableSearch = true;
      };
    };
  };
}
