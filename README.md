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


## Agradecimentos

Este mini projeto foi inspirado no repositório:

https://github.com/victorsoares96/cantadas/tree/master

Obrigado ao autor pela inspiração!