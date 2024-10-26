{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil # | Language Server
    manix # | CLI Documentation searcher for Nix
    nixpkgs-fmt # | Formatter
    nixfmt-rfc-style # | Formatter
    statix # | Linter
    cachix # | CLI Client for Nix binary cache hosting
    alejandra # | Formatter
  ];
}
