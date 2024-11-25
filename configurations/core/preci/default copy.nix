{
  config,
  lib,
  pkgs,
  ...
}:
let
  mod = "preci";
  cfg = config.DOTS.Systems.${mod};
in
with lib;
with types;
{
  options.DOTS.Systems.${mod} = {
    enable = mkEnableOption "Dell Precision M2800";
    allowDualBoot = mkEnableOption "Allow dual booting" // {
      default = true;
    };

    location = {
      timeZone = mkOption {
        description = "The time zone used for displaying time and dates.";
        default = "America/Jamaica";
        type = nullOr str;
      };

      latitude = mkOption {
        description = "The latitudinal coordinate as a decimal between `-90.0` and `90.0`";
        default = 18.015;
        type = float;
      };

      longitude = mkOption {
        description = "The longitudinal coordinate as a decimal between `-180.0` and `180.0`";
        default = -77.5;
        type = float;
      };
    };
  };

  config = mkIf cfg.enable {
    # inherit (cfg)
    # boot
    # fileSystems
    # swapDevices
    # nix
    # networking
    # nixpkgs
    # hardware
    # system

    time = {
      inherit (cfg.location) timeZone;
      hardwareClockInLocalTime = cfg.allowDualBoot;
    };
    # i18n
    # security
    # console
    # services
    # programs
    # environment
    # fonts
    # users
    # ;
  };
}
