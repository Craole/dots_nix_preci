{ pkgs, ... }:
# let
#   my-python-packages = p:
#     with p; [
#       pandas
#       requests
#       # other python packages
#     ];
# in
{
  home.packages = with pkgs; [
    python3
    black
  ];
}
# let
#   my-python-packages = p: with p; [
#     pandas
#     requests
#     # other python packages
#   ];
# in
# {
#   home.packages = [
#     (pkgs.python3.withPackages my-python-packages)
#   ];
# }
