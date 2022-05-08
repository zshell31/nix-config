{ config, lib, pkgs, ... }:

{
  programs.gnome-terminal = {
    showMenubar = false;
    profile = {
      "5ddfe964-7ee6-4131-b449-26bdd97518f7" = {
        default = true;
        visibleName = "Dracula";
        cursorShape = "ibeam";
        font = "FiraCode Nerd Font 14";
        showScrollbar = true;
        allowBold = true;
        audibleBell = false;
        transparencyPercent = 40;
        colors = {
          foregroundColor = "#F8F8F2";
          boldColor = "#6E46A4";
          backgroundColor = "#282A36";
          palette = [
            "#262626" "#E356A7" "#42E66C" "#E4F34A" "#9B6BDF" "#E64747" "#75D7EC" "#EFA554"
            "#7A7A7A" "#FF79C6" "#50FA7B" "#F1FA8C" "#BD93F9" "#FF5555" "#8BE9FD" "#FFB86C"
          ];
        };
      };
    };
  };
}
