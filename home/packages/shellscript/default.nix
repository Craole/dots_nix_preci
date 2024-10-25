{ pkgs, ... }:
{
  home.packages = with pkgs; [
    shfmt # | Formatter
    shellcheck # | Linter
    shellharden # | Linter
    rust-script # | Rust file runner
  ];
}
