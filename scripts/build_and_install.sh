#!/usr/bin/env bash
set -euo pipefail

# Build the cantadas_cli project and install the binary into a bin directory.
# If Cargo is not installed the script will attempt to install rustup (non-interactively).
# Usage:
#   ./scripts/build_and_install.sh [dest_dir]
# Example:
#   ./scripts/build_and_install.sh /usr/local/bin

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DEST_DIR="${1:-/usr/local/bin}"
BIN_NAME="cantadas_cli"
TARGET_BIN="$REPO_ROOT/target/release/$BIN_NAME"

echo "Repo root: $REPO_ROOT"

ensure_cargo() {
  if command -v cargo >/dev/null 2>&1; then
    echo "cargo found: $(command -v cargo)"
    return 0
  fi

  echo "cargo not found. Attempting to install Rust toolchain (rustup)..."
  if ! command -v curl >/dev/null 2>&1; then
    echo "curl is required to install rustup. Please install curl and re-run this script." >&2
    exit 1
  fi

  # Install rustup non-interactively
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

  # Source cargo env for current shell
  if [[ -f "$HOME/.cargo/env" ]]; then
    # shellcheck disable=SC1090
    source "$HOME/.cargo/env"
    echo "Rust toolchain installed. cargo=$(command -v cargo)"
  else
    echo "rustup installed but $HOME/.cargo/env not found. You may need to restart your shell." >&2
    exit 1
  fi
}

build_project() {
  echo "Building release binary..."
  cd "$REPO_ROOT"
  cargo build --release
}

install_binary() {
  if [[ ! -f "$TARGET_BIN" ]]; then
    echo "Build succeeded but target binary not found at $TARGET_BIN" >&2
    exit 1
  fi

  DEST_PATH="$DEST_DIR/$BIN_NAME"
  if [[ -w "$DEST_DIR" ]]; then
    mv -f "$TARGET_BIN" "$DEST_PATH"
  else
    echo "Destination $DEST_DIR not writable, will use sudo to move the file. You may be prompted for your password."
    sudo mv -f "$TARGET_BIN" "$DEST_PATH"
  fi
  sudo chmod +x "$DEST_PATH" >/dev/null 2>&1 || true
  echo "Installed $BIN_NAME -> $DEST_PATH"
}

main() {
  ensure_cargo
  build_project
  install_binary

  # Clear terminal and print final message
  clear
  echo "Instalação concluída com sucesso."
  echo "Agora digite no terminal: $BIN_NAME"
}

main "$@"
