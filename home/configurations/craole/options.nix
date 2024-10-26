{ config, lib, ... }:
with lib;
# with filesystem;
with types;
{
  options.DOTS.Defaults = {
    Browser = mkOption {
      description = "The main entrypoint to the config";
      example = "/dots";
      default = {
        primary = "brave";
        secondary = "firefox";
      };
      # default = (locateDominatingFile "flake.nix" ./.).path;
      type = str;
    };
  };
}

# prefs = {
#   browser = {
#     primary = "brave";
#     secondary = "firefox";
#   };
#   editor = {
#     primary = "hx";
#     secondary = "zeditor";
#   };
#   modifier = "SUPER";
#   launcher = {
#     primary = {
#       name = "rofi";
#       cmd = "rofi -show drun";
#     };
#     secondary = {
#       name = "anyrun";
#       cmd = "anyrun";
#     };
#   };
#   terminal = {
#     primary = "footclient";
#     secondary = "kitty";
#   };
#   visual = {
#     primary = "code";
#     secondary = "zeditor";
#   };
# };
