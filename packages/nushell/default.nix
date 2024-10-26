{ pkgs, ... }:
{
  programs.nushell.enable = true;
  home.packages = with pkgs; [
    nu_scripts
    vscode-extensions.thenuprojectcontributors.vscode-nushell-lang
  ];
}
