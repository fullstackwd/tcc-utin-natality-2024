# Dados

Esta pasta existe apenas para organizar a execução local dos notebooks.

## Entrada bruta

Use:

```text
data/raw/natality_2024/
```

para armazenar os arquivos brutos da Natality Data 2024, quando o notebook exigir arquivo local.

## Saída processada

O notebook 01 deve gerar:

```text
data/processed/natality_data_2024.parquet
```

Esse arquivo é usado como entrada principal do notebook 02.

## GitHub

Arquivos grandes de dados não devem ser enviados ao GitHub. Por isso, `data/raw/` e `data/processed/` ficam ignoradas no `.gitignore`, exceto pelos arquivos `.gitkeep` e este README.
