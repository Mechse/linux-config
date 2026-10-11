#!/usr/bin/env bash
# Hooks aliases.sh into the current user's shell startup files.
# Safe to run more than once.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MARKER="# linux-config"

add_hook() {
  local rc="$1"
  if [ -f "$rc" ] && grep -qF "$MARKER" "$rc"; then
    echo "already installed: $rc"
    return
  fi
  cat >> "$rc" <<EOF

$MARKER
export LINUX_CONFIG_DIR="$REPO_DIR"
[ -f "\$LINUX_CONFIG_DIR/aliases.sh" ] && . "\$LINUX_CONFIG_DIR/aliases.sh"
EOF
  echo "installed: $rc"
}

add_hook "$HOME/.bashrc"
if [ -f "$HOME/.zshrc" ]; then
  add_hook "$HOME/.zshrc"
fi

# SSH starts a login shell, which reads only the first of these files and
# not ~/.bashrc. Make sure that file pulls in ~/.bashrc.
login_file="$HOME/.bash_profile"
for f in "$HOME/.bash_profile" "$HOME/.bash_login" "$HOME/.profile"; do
  if [ -f "$f" ]; then
    login_file="$f"
    break
  fi
done
if ! { [ -f "$login_file" ] && grep -q 'bashrc' "$login_file"; }; then
  cat >> "$login_file" <<'EOF'

# linux-config: load ~/.bashrc in login shells (e.g. over SSH)
if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then . "$HOME/.bashrc"; fi
EOF
  echo "installed: $login_file (now sources ~/.bashrc)"
fi

echo "Done. Run 'source ~/.bashrc' or reconnect to start using the shortcuts."
