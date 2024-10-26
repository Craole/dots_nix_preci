{ pkgs, ... }:
{
  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [
      # | Utilities
      editorconfig.editorconfig
      tamasfe.even-better-toml
      oderwat.indent-rainbow
      naumovs.color-highlight
      # skellock.just
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "reload";
        publisher = "natqe";
        version = "0.0.6";
        sha256 = "sha256-bTFLk3sCJb7ztkC/Cxci6n7RbcyNjEYNKREUf9wDQRU=";
      }
      {
        name = "todo-tree";
        publisher = "gruntfuggly";
        version = "0.0.226";
        sha256 = "sha256-Fj9cw+VJ2jkTGUclB1TLvURhzQsaryFQs/+f2RZOLHs=";
      }
      {
        name = "multi-cursor-case-preserve";
        publisher = "cardinal90";
        version = "1.0.5";
        sha256 = "sha256-eJafjYDydD8DW83VLH9MPFeDENXBx3el7XvjZqu88Jw=";
      }
      {
        name = "ignore";
        publisher = "syler";
        version = "0.0.7";
        sha256 = "sha256-ekt74buCPD6aR7togBRkcOgWU8RH2oSRgm8vTmCgmGY=";
      }
    ];
}
