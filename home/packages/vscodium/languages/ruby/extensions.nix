{ pkgs, ... }:
{
  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [
      rebornix.ruby
      wingrunr21.vscode-ruby
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "ruby-lsp";
        publisher = "shopify";
        version = "0.6.3";
        sha256 = "sha256-U1pBCS3l3iSjbJXjSTyzij00xOG/xtNlL0i8KqDr6+U=";
      }
      {
        name = "vscode-rdbg";
        publisher = "koichisasada";
        version = "0.2.2";
        sha256 = "sha256-iqUxaMIeqMAyh5EyOiOxraGZZpZUegschMoVjtWz67c=";
      }
      {
        name = "sorbet-vscode-extension";
        publisher = "sorbet";
        version = "0.3.32";
        sha256 = "sha256-J9HWSzuzsW3j44VMtJVTCQBYb7sTF6AkzOQu3LkEPm4=";
      }
    ];
}
