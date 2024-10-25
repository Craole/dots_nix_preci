{ pkgs, ... }:
{
  programs.vscode = {
    extensions =
      with pkgs.vscode-extensions;
      [
        ms-azuretools.vscode-docker
        redhat.vscode-yaml
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "better-dockerfile-syntax";
          publisher = "jeff-hykin";
          version = "1.0.2";
          sha256 = "sha256-FaF+rhtAoWslmBoxet8rINyQlMxNl8kX1EE89ymnCcQ=";
        }
      ];
    keybindings = [ ];
    userSettings = { };
  };
}
