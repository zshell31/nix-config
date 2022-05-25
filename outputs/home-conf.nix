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
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
            "viber"
          ];
        };
        overlay-unstable = final: prev: {
          inherit unstable;
          nix-direnv = unstable.nix-direnv;
        };
      in
      {
        nixpkgs.config = {
          allowUnfree = true;
        };
        nixpkgs.overlays = [ overlay-unstable ];

        imports = [
          ../home/home.nix
        ];
      };
  };
}
