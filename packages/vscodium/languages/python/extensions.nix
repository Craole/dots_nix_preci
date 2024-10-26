{ pkgs, ... }:
{
  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [
      ms-python.python
      ms-python.vscode-pylance
      njpwerner.autodocstring
      # ms-python.black-formatter
      # ms-python.isort
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "ruff";
        publisher = "charliermarsh";
        version = "2024.0.0";
        sha256 = "sha256-YKQ9iv1aBNJ7OYjqwg6jLYPpYTMPctOKm0Tfh9F6qcQ=";
      }
    ];
}
