#!/usr/bin/env bash
set -euo pipefail

# Baixa o executável pré-compilado do repositório GitHub e o instala.
# Uso:
#   ./download_cantadas.sh [asset_name] [dest_path]
# Exemplo:
#   ./download_cantadas.sh cantadas_cli /usr/local/bin/cantadas

REPO="gusanagy/cantadas_rust"
ASSET_NAME="${1:-cantadas_cli}"
DEST="${2:-/usr/local/bin/cantadas}"
TMP_FILE="/tmp/${ASSET_NAME}_$$"

cleanup() {
  rm -f -- "$TMP_FILE" || true
}
trap cleanup EXIT

command -v curl >/dev/null 2>&1 || { echo "curl não encontrado. Instale curl e tente novamente." >&2; exit 1; }

echo "Procurando o asset '${ASSET_NAME}' na release mais recente de ${REPO}..."
URL=$(curl -s "https://api.github.com/repos/${REPO}/releases/latest" \
  | grep '"browser_download_url":' \
  | grep "${ASSET_NAME}" || true)

if [[ -n "$URL" ]]; then
  URL=$(echo "$URL" | cut -d'"' -f4)
else
  echo "Asset não encontrado via API de releases; tentando o URL direto de download de 'latest'..."
  URL="https://github.com/${REPO}/releases/latest/download/${ASSET_NAME}"
fi

echo "Baixando de: $URL"
curl -L --fail -o "$TMP_FILE" "$URL"
chmod +x "$TMP_FILE"

DEST_DIR=$(dirname -- "$DEST")
if [[ -w "$DEST_DIR" ]]; then
  mv "$TMP_FILE" "$DEST"
else
  echo "Movendo com sudo para $DEST (será solicitada a senha)..."
  sudo mv "$TMP_FILE" "$DEST"
fi

echo "Instalado em: $DEST"
echo "Pronto! Agora você pode executar: $(basename "$DEST")"
