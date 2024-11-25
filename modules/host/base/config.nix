{
  config,
  lib,
  modulesPath,
  ...
}:
let
  #| Internal Imports
  inherit (config.DOTS) Active;
  inherit (Active) host;

  #| External Imports
  # inherit (builtins) toString;
  inherit (lib) filter;
  inherit (lib.modules) mkIf mkDefault mkForce;
  inherit (lib.options) mkOption;
  inherit (lib.types) attrs;
  inherit (lib.attrsets) genAttrs;

  hostConfig =
    with host;
    if enable then
      let
        mkInterfaces =
          networkDevices: permitted:
          if permitted then
            genAttrs networkDevices (iface: {
              useDHCP = mkDefault true;
            })
          else
            { };

        autoLoginUser =
          let
            lastAutoLoginUser = last (filter (user: user.autoLogin) people);
          in
          if lastAutoLoginUser == null then null else lastAutoLoginUser.name;
      in
      {
        inherit fileSystem;
        boot =
          if (machine == "server") then
            { }
          else
            {
              inherit kernelModules;
              initrd = {
                inherit (boot) availableKernelModules;
                luks.devices = devices.luks;
              };
              loader = with boot; {
                systemd-boot = {
                  enable = loader == "systemd";
                  inherit configurationLimit;
                };
                grub = {
                  enable = loader == "grub";
                  efiSupport = isEfi;
                  useOSProber = allowDualBoot;
                  default = "saved";
                  splashImage = null;
                  mirroredBoots = [
                    {
                      devices = [ "nodev" ];
                      path = "/boot";
                    }
                  ];
                  inherit configurationLimit theme;
                };
                efi.canTouchEfiVariables = isEfi;
                inherit timeout;
              };
            };
        fileSystem = devices.drives;
        swapDevices = devices.swap;
        environment = with paths; {
          variables = {
            NIX_FLAKE = mkIf (flake != null) (mkForce flake);
            NIX_CONFIG = mkForce conf;
          };
          shellAliases = {
            Flake = mkIf (flake != null) (mkForce ("NixOS --flake ${flake}#${name}"));
          };
        };
        networking = {
          hostName = name;
          hostId = id;
          networkmanager.enable = allowNetwork && (machine != "server");
          interfaces = mkInterfaces devices.net allowNetwork;
        };
        location = with location; {
          inherit longitude latitude;
          provider = if (latitude == null || longitude == null) then "geoclue2" else "manual";
        };
        time = {
          inherit (location) timeZone;
          hardwareClockInLocalTime = boot.allowDualBoot;
        };
        i18n = {
          defaultLocale = mkDefault location.locale;
        };
        nix = {
          gc = with garbage; {
            automatic = enable;
            dates = clean;
            options = "--delete-older-than ${trash}";
          };
          settings = {
            auto-optimise-store = true;
            system-features = [
              "big-parallel"
              "kvm"
              "recursive-nix"
              "nixos-test"
            ];
            experimental-features = [
              "nix-command"
              "flakes"
              "repl-flake"
            ];
          };
        };
        nixpkgs = {
          hostPlatform = mkDefault processor.arch;
        };
        powerManagement = {
          cpuFreqGovernor = mkDefault processor.mode;
        };
        security = {
          sudo = {
            execWheelOnly = true;
            extraRules = [
              {
                users = map (user: user.name) (filter (user: user.elevated) people);
                commands = [
                  {
                    command = "ALL";
                    options = [
                      "SETENV"
                      "NOPASSWD"
                    ];
                  }
                ];
              }
            ];
          };
        };
        console = {
          inherit (fonts.console) packages font;
          earlySetup = true;
          useXkbConfig = true;
        };
        system = {
          inherit stateVersion;
        };
        services = {
          displayManager = {
            autoLogin = {
              enable = autoLoginUser != null;
              user = autoLoginUser;
            };
            sddm = {
              enable = true;
              wayland.enable = true;
            };
          };

          desktopManager = {
            plasma6.enable = true;
            # gnone.enable = true;
          };

          kmscon = {
            enable = true;
            inherit autologinUser;
          };
        };
      }
    else
      { };
in
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  options.DOTS.Config.host = mkOption {
    description = "Config options to pass to the actual system config";
    default = hostConfig;
    type = attrs;
  };

  config = {
    inherit (hostConfig)
      boot
      environment
      location
      networking
      time
      nix
      nixpkgs
      powerManagement
      security
      system
      ;

    # nixpkgs = {
    #   # hostPlatform = processor.arch;
    #   hostPlatform = mkForce "x86_64-linux";
    # };
  };
  # config.boot.loader.grub.configurationLimit = hostConfig.boot.loader.grub.configurationLimit;
}
