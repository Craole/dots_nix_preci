{
  pkgs ? import <nixpkgs> { },
}:

let
  # Import all directories in the current directory (home/packages)
  packages = builtins.mapAttrs (name: path: import (path + "/default.nix")) (
    builtins.attrNames (builtins.readDir ./.)
  );
in
# Expose all packages as an attribute set
packages
