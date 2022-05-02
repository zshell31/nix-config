{ config, lib, pkgs, ... }:

let
  customDir = "$HOME/zsh_custom";
  customPluginsDir = "${customDir}/plugins";
  customThemesDir = "${customDir}/themes";

  draculaTheme = "dracula.zsh-theme";
  draculaThemePath =
    pkgs.fetchFromGitHub {
      owner = "dracula";
      repo = "zsh";
      rev = "6e256a1c143331ae20d4fa81625fd647990dd9d9";
      sha256 = "1c4x6zk2zdn27lhkkbfbx5rwvyz3c53rc89j640fyw12v2b0vfbs";
    } + "/${draculaTheme}";
in
{
  programs.zsh = {
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    shellAliases = {
      c = "clear";
      ll = "ls -lah";
      vim = "nvim";
      hms = "home-manager switch";
      cat = "bat";
    };

    localVariables = {
      EDITOR = "nvim";
    };

    initExtraFirst = ''
      if [[ ! -d "${customDir}" ]]; then
	mkdir -p "${customDir}"
      fi
      if [[ ! -d "${customPluginsDir}" ]]; then
	mkdir -p "${customPluginsDir}"
      fi
      if [[ ! -d "${customThemesDir}" ]]; then
	mkdir -p "${customThemesDir}"
      fi

      if [[ ! -L "${customThemesDir}/${draculaTheme}" ]]; then
	ln -s "${draculaThemePath}" "${customThemesDir}/${draculaTheme}"
      fi
    '';

    oh-my-zsh = {
      enable = true;

      custom = customDir;

      plugins = [
        "git"
	"vi-mode"
	"colored-man-pages"
      ];

      theme = "dracula";
    };
  };
}
