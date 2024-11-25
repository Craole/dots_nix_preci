{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (processor) cpu;
in
{
  config =
    with config.DOTS.libraries.host;
    mkIf (machine == "laptop") {
      boot = {
        initrd.availableKernelModules = [
          "xhci_pci"
          "ehci_pci"
          "ahci"
          "usb_storage"
          "sd_mod"
          "sr_mod"
          "sdhci_pci"
        ];
        kernelModules =
          (
            if (cpu == "intel") then
              [ "kvm-intel" ]
            else if (cpu == "amd") then
              [ "kvm-amd" ]
            else
              [ ]
          )
          ++ config.boot.kernelModules;
      };

      hardware = {
        bluetooth = {
          enable = true;
          settings.General = {
            Enable = "Source,Sink,Media,Socket";
            Experimental = true;
          };
        };
        enableRedistributableFirmware = true;
        cpu.${cpu}.updateMicrocode = true;
        sensor = {
          iio.enable = true;
          hddtemp.enable = true;
        };
      };
      services = {
        blueman.enable = true;
        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
          jack.enable = true;
          extraConfig.pipewire."92-low-latency" = {
            context.properties.default.clock = {
              rate = 48000;
              quantum = 32;
              min-quantum = 32;
              max-quantum = 32;
            };
          };
        };
      };

      sound.enable = false;
      security.rtkit.enable = true;

      environment.systemPackages = with pkgs; [
        pavucontrol
        easyeffects
        qjackctl
        brightnessctl
      ];
    };
}
