{ inputs, lib, system, nixpkgs-unstable, ... }:

{
  home = lib.nixosSystem {
    inherit system;
    specialArgs = inputs;
    modules = [
      ({ config, pkgs, ... }:
        let
          overlay-unstable = final: prev: {
            unstable = nixpkgs-unstable.legacyPackages.${system};
          };
        in
        { 
          nixpkgs.overlays = [ overlay-unstable ]; 
          environment.systemPackages = with pkgs; [
            neovim
          ];
        }
      )
      ../system/machine
      ../system/configuration.nix
    ];
  };
}
