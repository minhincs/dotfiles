set -gx MANPAGER 'nvim +Man!'
set -gx MANROFFOPT -P-c
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
set -gx BROWSER brave-origin
set -gx TERMINAL foot
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -U fish_greeting

fish_add_path --global --path --move $HOME/.cargo/bin $HOME/.local/bin

if status is-login; and status is-interactive
  if not set -q WAYLAND_DISPLAY; and not set -q UMBRIEL_LOGIN_REENTRY; and test (tty 2>/dev/null) = /dev/tty1
    exec start-umbriel
  end
end

if status is-interactive
  zoxide init --cmd cd fish | source

  function __blank_line_after_command --on-event fish_postexec
    echo
  end
end
