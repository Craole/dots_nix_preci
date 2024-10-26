{ pkgs, userArgs, ... }:
let
  inherit (userArgs.options.browser.firefox) package;
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.${package};
  };
}
