# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      per-window = false;
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple ["xkb" "ru" ]) ];
      xkb-options = [ "eurosign:e" ];
    };

    "org/gnome/desktop/interface" = {
      document-font-name = "FiraCode Nerd Font 12";
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      font-name = "FiraCode Nerd Font 12";
      monospace-font-name = "FiraCode Nerd Font Mono Light 12";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };
    
    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      switch-input-source = [ "<Super>space" ];
      switch-input-source-backward = [ "<Shift><Super>space" ];
     };

    "org/gnome/desktop/privacy" = {
      disable-microphone = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      titlebar-font = "FiraCode Nerd Font 12";
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "small";
    };

    "org/gnome/shell" = {
      disabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "dash-to-panel@jderose9.github.com" ];
      favorite-apps = [
        "org.gnome.Terminal.desktop"
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
        "@joplinapp-desktop.desktop"
        "telegramdesktop.desktop"
      ];
    };

    "org/gnome/shell/extensions/dash-to-panel" = {
      animate-appicon-hover-animation-extent = "{'RIPPLE': 4, 'PLANK': 4, 'SIMPLE': 1}";
      appicon-margin = 8;
      appicon-padding = 4;
      available-monitors = [ 0 ];
      dot-color-dominant = false;
      dot-color-override = false;
      dot-position = "BOTTOM";
      dot-size = 5;
      dot-style-focused = "DOTS";
      dot-style-unfocused = "DOTS";
      focus-highlight-dominant = true;
      focus-highlight-opacity = 25;
      group-apps = true;
      hotkeys-overlay-combo = "TEMPORARILY";
      leftbox-padding = -1;
      panel-anchors = "{\"0\":\"MIDDLE\"}";
      panel-element-positions = "{\"0\":[{\"element\":\"showAppsButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"activitiesButton\",\"visible\":false,\"position\":\"stackedTL\"},{\"element\":\"leftBox\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"taskbar\",\"visible\":true,\"position\":\"stackedTL\"},{\"element\":\"centerBox\",\"visible\":true,\"position\":\"centerMonitor\"},{\"element\":\"dateMenu\",\"visible\":true,\"position\":\"centerMonitor\"},{\"element\":\"rightBox\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"systemMenu\",\"visible\":true,\"position\":\"stackedBR\"},{\"element\":\"desktopButton\",\"visible\":true,\"position\":\"stackedBR\"}]}";
      panel-lengths = "{\"0\":100}";
      panel-positions = "{\"0\":\"TOP\"}";
      panel-sizes = "{\"0\":33}";
      status-icon-padding = -1;
      trans-bg-color = "#241f31";
      trans-panel-opacity = 0.7;
      trans-use-custom-bg = true;
      trans-use-custom-opacity = true;
      tray-padding = -1;
      window-preview-title-position = "TOP";
    };
  };
}
