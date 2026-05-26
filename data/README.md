# Dados

Esta pasta foi preparada para receber os arquivos usados no pipeline.

## Estrutura

```text
data/
├── raw/        # arquivos originais baixados da fonte pública
├── interim/    # arquivos intermediários de processamento
└── processed/  # bases tratadas para análise
```

## Arquivos esperados

O notebook `01_preparo_reprodutivel_natality_data_2024.ipynb` busca/processa o arquivo público de natalidade dos EUA de 2024 e gera:

```text
data/processed/natality_data_2024.parquet
```

O notebook `02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb` usa esse Parquet como entrada principal.

## Por que os dados não estão versionados?

Microdados e Parquets derivados podem ser grandes. Por isso, eles são ignorados pelo Git via `.gitignore`. Para reproduzir os resultados, execute o notebook 01 antes do notebook 02.

## Observação metodológica

A proxy RPM/PPROM do projeto é operacional e retrospectiva, sem equivalência diagnóstica individual.
