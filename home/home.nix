{ config, lib, pkgs, ... }:

let
  defaultPkgs = with pkgs; [
    cmake
    gnome3.gnome-tweak-tool
    gnomeExtensions.dash-to-panel
    gnome.dconf-editor
    docker-compose
    dive
    dracula-theme
    du-dust
    duf
    exa
    fd
    file
    gimp
    glow
    ( pkgs.nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    libreoffice
    ncdu
    ripgrep
    rnix-lsp
    rustup
    papirus-icon-theme
    patchelf
    python310
    tdesktop
    tldr
    tree
    unzip
    vlc
    xsel

    unstable.rust-analyzer
  ];

  clangPkgs = with pkgs.llvmPackages_11; [
    libcxxabi
    libcxxClang
    libcxxStdenv
  ];

  haskellPkgs = with pkgs.haskellPackages; [
    ghc
    haskell-language-server
    ormolu
    hoogle
    stack
  ];

  nodePkgs = with pkgs.nodePackages; [
    npm
  ];

in
{
  imports = [
    ./bat.nix
    ./dconf.nix
    ./gnome_terminal.nix
    ./tmux.nix
    ./zsh.nix
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    bat.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    gnome-terminal.enable = true;

    starship = {
      enable = true;
      enableZshIntegration = true;
    };

    tmux.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh.enable = true;
  };

  fonts.fontconfig.enable = true;

  gtk.enable = true;
  gtk.theme.name = "Dracula";
  gtk.iconTheme.name = "Papirus-Dark";

  home.packages = defaultPkgs ++ clangPkgs ++ haskellPkgs ++ nodePkgs;
}
