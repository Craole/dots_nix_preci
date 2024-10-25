{ pkgs, userArgs, ... }:
let
  inherit (userArgs.options.browser.chromium) package;
in
{
  programs.chromium = {
    enable = true;
    package = pkgs.${package};
  };
}
