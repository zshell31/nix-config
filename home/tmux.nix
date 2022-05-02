{ config, lib, pkgs, ... }:
{
  programs.tmux = {
    keyMode = "vi";
    prefix = "`";
    terminal = "screen-256color";
    clock24 = true;

    plugins = with pkgs.tmuxPlugins; [
      yank
      {
	plugin = dracula;
	extraConfig = ''
	  set -g @dracula-plugins "cpu-usage"
	  set -g @dracula-show-flags true
	  set -g @dracula-show-powerline true
	  set -g @dracula-refresh-rate 10
	  set -g @dracula-show-left-icon window
	'';
      }
    ];

    extraConfig = ''
      set -g status-position top
      set -g set-titles on
      set -g mouse on
      set -g status-interval 5
      set -g base-index 1
      set -g pane-base-index 0
      set -g renumber-windows on

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
      bind -r C-h resize-pane -U
      bind -r C-j resize-pane -D
      bind -r N swap-window -t +1\; select-window -t +1
      bind -r P swap-window -t -1\; select-window -t -1
    '';
  };
}
