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
      {
	nixpkgs.config.allowUnfree = true;

	imports = [
	  ../home/home.nix
        ];
      };
  };
}
