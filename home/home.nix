{ config, lib, pkgs, ... }:

let
  defaultPkgs = with pkgs; [
    bear
    clang_13
    cmake
    gnome3.gnome-tweaks
    gnomeExtensions.dash-to-panel
    gnome.dconf-editor
    gparted
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
    gnumake
    inetutils
    jre
    nix-tree
    ( pkgs.nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
    libreoffice
    ncdu
    ripgrep
    rnix-lsp
    rustup
    papirus-icon-theme
    patchelf
    python310
    shadowsocks-libev
    tdesktop
    tldr
    tree
    unzip
    virt-manager
    vlc
    xsel
    qucs-s
    quartus-prime-lite
    wineWowPackages.stable
    winetricks

    unstable.clang-tools
    unstable.joplin-desktop
    unstable.qbittorrent
    unstable.rust-analyzer
    unstable.viber
    unstable.firefox
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
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "quartus-prime-lite-unwrapped"
  ];

  imports = [
    ./bat.nix
    ./dconf.nix
    ./gnome_terminal.nix
    ./tmux.nix
    ./zsh.nix
    ./vscode.nix
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

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd --type file --follow";
      defaultOptions = [
        "--height 30%"
        "--layout=reverse"
        "--color=dark"
        "--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f"
        "--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7"
      ];
      fileWidgetCommand = "fd --type file --follow";
      fileWidgetOptions = [ "--preview 'head {}'" ];
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

    vscode.enable = true;
  };

  fonts.fontconfig.enable = true;

  gtk.enable = true;
  gtk.theme.name = "Dracula";
  gtk.iconTheme.name = "Papirus-Dark";

  home.packages = defaultPkgs ++ haskellPkgs ++ nodePkgs;
}
