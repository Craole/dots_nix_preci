{ config, lib, ... }:
let
  mod = "preci";
  cfg = config.DOTS.Systems.${mod};
in
with lib;
with types;
{
  options.DOTS.Systems.${mod} = {
    enable = mkEnableOption "Dell Precision M2800";
    conf = mkOption {
      default = {

        boot = {
          initrd = {
            availableKernelModules = [
              "xhci_pci"
              "ehci_pci"
              "ahci"
              "usb_storage"
              "sd_mod"
              "sr_mod"
              "sdhci_pci"
            ];
            kernelModules = [ ];
            luks.devices = {
              "luks-d6bafe54-e55b-49b8-ab7c-18380939f56f" = {
                device = "/dev/disk/by-uuid/d6bafe54-e55b-49b8-ab7c-18380939f56f";
              };
              "luks-540965a0-c573-42f9-8d14-2ae37c3715e6" = {
                device = "/dev/disk/by-uuid/540965a0-c573-42f9-8d14-2ae37c3715e6";
              };
            };
          };

          loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
          };

          kernelModules = [ "kvm-intel" ];
          extraModulePackages = [ ];
        };
      };
      description = "Preci configuration";
      type = attrs;
    };
  };

  config = mkIf cfg.enable {
    inherit cfg;
  };
}
