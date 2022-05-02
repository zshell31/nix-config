{
  description = "Home Manager (dotfiles) and NixOS configurations";

  inputs = {
    nixpkgs.url = "nixpkgs/21.11";

    # home-manager = {
    #   url = github:nix-community/home-manager;
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
    in
    {
      # homeConfigurations = (
      #   import ./outputs/home-conf.nix {
      #     inherit system nixpkgs nurpkgs home-manager tex2nix;
      #   }
      # );

      nixosConfigurations = (
        import ./outputs/nixos-conf.nix {
          inherit (nixpkgs) lib;
          inherit system;
        }
      );
    };
}
