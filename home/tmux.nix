{ config, lib, pkgs, ... }:
{
  programs.tmux = {
    keyMode = "vi";
    prefix = "`";
    terminal = "screen-256color";
    baseIndex = 1;
    clock24 = true;

    extraConfig = ''
      set -g status-position top
      set -g set-titles on

      bind r source-file ~/.tmux.conf \; display "Reloaded!"
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'
      bind c new-window -c '#{pane_current_path}'
      bind & kill-window
      bind x kill-pane
      bind n next-window
      bind p previous-window
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
      bind -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -i -f -selection primary | xclip -i -selection clipboard"
    '';
  };
}
