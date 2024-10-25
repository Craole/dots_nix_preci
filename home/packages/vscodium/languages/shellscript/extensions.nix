{ pkgs, ... }:
{
  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [
      timonwong.shellcheck
      foxundermoon.shell-format
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-shellscript-syntax";
        publisher = "jeff-hykin";
        version = "1.6.3";
        sha256 = "sha256-51QuDTxMTPEtEYKWX0dbNTMjTfikD6ZK59Tvxfkh9X8=";
      }
    ];
}
