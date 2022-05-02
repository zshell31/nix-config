{ config, pkgs, ... }:

{
  imports =  [
    # Hardware scan
    ./hardware-configuration.nix
  ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;

    # See https://kennyballou.com/blog/2019/07/nixos-md-luks-lvm-setup/index.html
    loader = {
      systemd-boot = {
        enable = true;
	editor = false;
      };

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
