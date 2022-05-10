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
          # unstable = nixpkgs-unstable.legacyPackages.${system};
          unstable = import nixpkgs-unstable {
              inherit system;
              config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
                "viber"
              ];
            };
        };
      in
      {
        nixpkgs.config = {
          allowUnfree = true;
          # packageOverrides = pkgs: {
          #   # https://github.com/nix-community/nix-direnv/issues/122#issuecomment-994154785
          #   nix-direnv = pkgs.nix-direnv.override {
          #     nix = pkgs.nixUnstable;
          #   };
          # };
        };
        nixpkgs.overlays = [ overlay-unstable ];

        imports = [
          ../home/home.nix
        ];
      };
  };
}
