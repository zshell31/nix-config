{ config, lib, pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./dconf.nix
    ./gnome_terminal.nix
    ./zsh.nix
  ];

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    gnome-terminal.enable = true;
    
    zsh.enable = true;

    bat.enable = true;
  };

  fonts.fontconfig.enable = true;

  gtk.enable = true;
  gtk.theme.name = "Dracula";
  gtk.iconTheme.name = "Papirus-Dark";

  home.packages = with pkgs; [
    gnome3.gnome-tweak-tool

    gnomeExtensions.dash-to-panel

    gnome.dconf-editor

    dracula-theme
    papirus-icon-theme

    fira-code
    fira-code-symbols

    ripgrep
    rustup

    unzip
  ];
}
