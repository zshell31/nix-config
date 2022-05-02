{ config, pkgs, ... }:

{
  imports =  [
    # Hardware scan
    ./hardware-configuration.nix
  ];

  boot = {
    # kernelPackages = pkgs.linuxPackages_latest;

    # Use the systemd-boot EFI boot loader.
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "home";
    interfaces = {
      wlo1.useDHCP = true;
    };
  };
}
