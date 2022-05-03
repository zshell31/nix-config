{ config, lib, pkgs, ... }:

let
  defaultPkgs = with pkgs; [
    gnome3.gnome-tweak-tool
    gnomeExtensions.dash-to-panel
    gnome.dconf-editor
    docker-compose
    dive
    dracula-theme
    duf
    exa
    fd
    gimp
    glow
    fira-code
    fira-code-symbols
    libreoffice
    ncdu
    ripgrep
    rnix-lsp
    rustup
    papirus-icon-theme
    python310
    tdesktop
    tldr
    tree
    unzip
    vlc
    xsel
  ];

  haskellPkgs = with pkgs.haskellPackages; [
    ghc
    haskell-language-server
    ormolu
    hoogle
    stack
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
      nix-direnv.enable = true;
    };

    gnome-terminal.enable = true;

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

  home.packages = defaultPkgs ++ haskellPkgs;
}
