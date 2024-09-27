{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

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

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/5fe83d0f-15a3-4abf-abb2-2ba02cc9195d";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/542E-33C1";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/d1aa80d2-ba1f-412f-9d81-5c5f5c6a839d"; }
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
  networking = {
    hostName = "preci";
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    useDHCP = lib.mkDefault true;

    interfaces = {
      eno1.useDHCP = lib.mkDefault true;
      wlp3s0.useDHCP = lib.mkDefault true;
    };

    firewall = {
      enable = false;
      # allowedTCPPorts = [ ... ];
      # allowedUDPPorts = [ ... ];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    pulseaudio.enable = false;
  };

  system = {
    stateVersion = "24.05";
  };

  time.timeZone = "America/Jamaica";
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "craole";
      };
      sddm.enable = true;
    };

    desktopManager.plasma6.enable = true;

    libinput.enable = true;

    tailscale = {
      enable = true;
    };

    ollama = {
      enable = true;
      loadModels = [
        "mistral-nemo"
      ];
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # jack.enable = true;
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };

  };

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [
    helix
    nil
    nixfmt-rfc-style
    btop
    dust
    speedtest-go
    nix-info
    bat
  ];

  users.users = {
    craole = {
      isNormalUser = true;
      description = "Craole";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      packages = with pkgs; [ zed-editor ];
    };
  };
}