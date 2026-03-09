# Cantadas (Rust)

Pequeno utilitário em Rust para imprimir cantadas.

## Requisitos

- Rust e Cargo instalados (veja https://www.rust-lang.org/tools/install).

## Como rodar e instalar

Para testar agora (modo de desenvolvimento):

```bash
cargo run
```

Para gerar o executável final (super rápido):

```bash
cargo build --release
```

O arquivo binário ficará em `./target/release/cantadas_cli`.

### Instalar como comando global

Para usar o programa como um comando global no seu terminal, mova o binário para uma pasta de binários no PATH (por exemplo `/usr/local/bin`):

```bash
sudo cp target/release/cantadas_cli /usr/local/bin/cantadas
```

Depois disso, basta digitar `cantadas` em qualquer lugar do seu terminal.

## Baixar binário pré-compilado

Se você preferir baixar apenas o executável já compilado, há duas opções:

- Usar o script provido no repositório (recomendado quando houver releases com o asset):

```bash
chmod +x scripts/download_cantadas.sh
./scripts/download_cantadas.sh
```

O script tenta baixar o asset chamado `cantadas_cli` da release mais recente do repositório e o instala em `/usr/local/bin/cantadas` (usar sudo se necessário). Você também pode passar um nome de asset e um destino:

```bash
./scripts/download_cantadas.sh nome_do_asset /caminho/de/destino
```

- Download direto (quando houver um asset em releases):

```bash
curl -L -o cantadas_cli "https://github.com/gusanagy/cantadas_rust/releases/latest/download/cantadas_cli"
chmod +x cantadas_cli
sudo mv cantadas_cli /usr/local/bin/cantadas
```

Nota: para que o download direto funcione, o repositório precisa ter uma release com o binário anexado com o nome `cantadas_cli` (ou outro nome que você passará ao script).

## Agradecimentos

Este mini projeto foi inspirado no repositório:

https://github.com/victorsoares96/cantadas/tree/master

Obrigado ao autor pela inspiração!