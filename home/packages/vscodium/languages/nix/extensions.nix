{ pkgs, ... }:
{
  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [
      kamadorueda.alejandra
      mkhl.direnv
      # arrterian.nix-env-selector
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-nix-syntax";
        publisher = "jeff-hykin";
        version = "1.1.5";
        sha256 = "sha256-9V+ziWk9V4LyQiVNSC6DniJDun+EvcK30ykPjyNsvp0=";
      }
    ];
}
