#!/usr/bin/env bash
set -euo pipefail

# Baixa os arquivos cantadas_cli e cantadas_cli.d da release mais recente do GitHub
# e os instala no diretório de destino (por padrão /usr/local/bin).
# Uso:
#   ./scripts/download_cantadas.sh [dest_dir]
# Exemplo:
#   ./scripts/download_cantadas.sh /usr/local/bin

REPO="gusanagy/cantadas_rust"
ASSET_BIN="cantadas_cli"
ASSET_DBG="cantadas_cli.d"
DEST_DIR="${1:-/usr/local/bin}"

command -v curl >/dev/null 2>&1 || { echo "curl não encontrado. Instale curl e tente novamente." >&2; exit 1; }

TMPBIN="/tmp/${ASSET_BIN}_$$"
TMPDBG="/tmp/${ASSET_DBG}_$$"

cleanup() {
  rm -f -- "$TMPBIN" "$TMPDBG" || true
}
trap cleanup EXIT

download_asset() {
  local asset="$1" tmpfile="$2"
  local url="https://github.com/${REPO}/releases/latest/download/${asset}"
  echo "Baixando ${asset} de: ${url}"
  if curl -fL -o "$tmpfile" "$url"; then
    echo "Download de ${asset} concluído: $tmpfile"
  else
    echo "Falha ao baixar ${asset} (404 ou outro erro). Verifique se a release possui o asset." >&2
    return 1
  fi
}

echo "Tentando baixar binário e arquivo .d da release mais recente de ${REPO}..."

download_asset "$ASSET_BIN" "$TMPBIN"
download_asset "$ASSET_DBG" "$TMPDBG" || true

chmod +x "$TMPBIN" || true

DEST_BIN_PATH="$DEST_DIR/${ASSET_BIN}"
DEST_DBG_PATH="$DEST_DIR/${ASSET_DBG}"

if [[ -w "$DEST_DIR" ]]; then
  mv -f "$TMPBIN" "$DEST_BIN_PATH"
  if [[ -f "$TMPDBG" ]]; then mv -f "$TMPDBG" "$DEST_DBG_PATH"; fi
else
  echo "Diretório $DEST_DIR não gravável — movendo com sudo (será solicitada a senha)..."
  sudo mv -f "$TMPBIN" "$DEST_BIN_PATH"
  if [[ -f "$TMPDBG" ]]; then sudo mv -f "$TMPDBG" "$DEST_DBG_PATH"; fi
fi

echo "Instalação concluída. Arquivos instalados em:"
echo "  - $DEST_BIN_PATH"
if [[ -f "$DEST_DBG_PATH" ]]; then
  echo "  - $DEST_DBG_PATH"
fi

echo "Dica: renomeie $DEST_BIN_PATH para 'cantadas' se quiser um comando curto, ex: sudo mv $DEST_BIN_PATH /usr/local/bin/cantadas"
