{ lib, system, ... }:

{
  home = lib.nixosSystem {
    inherit system;
    specialArgs = { };
    modules = [
      ../system/machine
      ../system/configuration.nix
    ];
  };
}
