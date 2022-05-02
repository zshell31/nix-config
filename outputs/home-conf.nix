{ system, inputs, nixpkgs, home-manager, ... }:

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
          unstable = inputs.nixpkgs-unstable.legacyPackages.${system};
        };
      in
      {
        # nixpkgs.overlays = [ overlay-unstable ];
	nixpkgs.config.allowUnfree = true;

	imports = [
	  ../home/home.nix
        ];
      };
  };
}
