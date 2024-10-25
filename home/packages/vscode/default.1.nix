{
  #   coreArgs,
  #   config,
  pkgs,
#   ...
}:
# let
#   inherit (coreArgs.lib) ifGui pkgsUnfreeOrFree;
# in
#   ifGui config {
#     # TODO: Add the unFree setting just for vscode
#     home.packages =
#       pkgsUnfreeOrFree config (
#         with pkgs; [vscode-fhs]
#       ) (
#         with pkgs; [vscodium-fhs]
#       );
#   }
{
  # programs.vscode.enable = true;
  home.packages = with pkgs; [ vscode-fhs ];
}
