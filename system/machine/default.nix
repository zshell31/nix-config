{ config, pkgs, ... }:

{
  imports =  [
    # Hardware scan
    ./hardware-configuration.nix
  ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["ntfs"];

    # See https://kennyballou.com/blog/2019/07/nixos-md-luks-lvm-setup/index.html
    loader = {
      # systemd-boot = {
      #   enable = false;
      #   editor = false;
      # };

      efi.canTouchEfiVariables = false;

      grub = {
        enable = true;
        copyKernels = true;
        efiInstallAsRemovable = true;
        efiSupport = true;
        fsIdentifier = "uuid";
        splashMode = "stretch";
        version = 2;
        device = "nodev";
        splashImage = "/home/evgeny/nix-config/imgs/grub.jpg";
        extraEntries = ''
          menuentry "Reboot" {
            reboot
          }

          menuentry "Poweroff" {
            halt
          }
        '';
      };
    };
  };

  networking = {
    hostName = "home";
    interfaces = {
      wlo1.useDHCP = true;
    };
  };
}
