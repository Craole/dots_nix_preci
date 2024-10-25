{ pkgs, ... }:
{
  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [
      rust-lang.rust-analyzer
      # serayuzgur.crates # Replaced with sparse-crates
      techtheawesome.rust-yew
    ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "rust-syntax";
        publisher = "dustypomerleau";
        version = "0.6.1";
        sha256 = "sha256-o9iXPhwkimxoJc1dLdaJ8nByLIaJSpGX/nKELC26jGU=";
      }
      {
        name = "vscode-rust-test-adapter";
        publisher = "swellaby";
        version = "0.11.0";
        sha256 = "sha256-IgfcIRF54JXm9l2vVjf7lFJOVSI0CDgDjQT+Hw6FO4Q=";
      }
      {
        name = "sparse-crates";
        publisher = "citreae535";
        version = "0.1.0";
        sha256 = "sha256-IDu+UwajH+iBS2JWi20FJPO1D3XfDf8giNeyMA2iyoU=";
      }
      # {
      #   name = "cargo";
      #   publisher = "panicbit";
      #   version = "0.2.3";
      #   sha256 = "sha256-B0oLZE8wtygTaUX9/qOBg9lJAjUUg2i7B2rfSWJerEU=";
      # }
    ];
}
