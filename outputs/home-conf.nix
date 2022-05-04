{ system, nixpkgs, nixpkgs-unstable, home-manager, ... }:

let
  username = "evgeny";
  homeDirectory = "/home/${username}";
  configHome = "${homeDirectory}/.config";
in
{
  evgeny = home-manager.lib.homeManagerConfiguration {
    inherit system username homeDirectory;

    stateVersion = "21.11";
    configuration = { config, pkgs, ... }:
      let
        overlay-unstable = final: prev: {
          unstable = nixpkgs-unstable.legacyPackages.${system};
        };
      in
      {
        nixpkgs.config = {
          allowUnfree = true;
          packageOverrides = pkgs: {
            nix-direnv = pkgs.nix-direnv.override {
              nix = pkgs.nixUnstable;
            };
          };
        };
        nixpkgs.overlays = [ overlay-unstable ];

        imports = [
          ../home/home.nix
        ];
      };
  };
}
