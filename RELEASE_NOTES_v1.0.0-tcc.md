# Release v1.0.0-tcc

## Versão acadêmica inicial

Primeira versão pública do repositório mínimo para execução dos notebooks do TCC:

**Estratificação retrospectiva do risco de internação em UTIN em nascimentos: aplicação de Health Analytics à Natality Data 2024, com ênfase em prematuridade e proxy operacional compatível com contexto de RPM/PPROM.**

## Conteúdo

- Notebook 01: obtenção automática, extração, leitura fixed-width, processamento e geração da base Parquet.
- Notebook 02: análise exploratória, regressões, modelagem supervisionada, calibração, métricas, tabelas e gráficos.
- Arquivos de ambiente:
  - `requirements.txt`
  - `environment.yml`
- Script de execução:
  - `scripts/run_notebooks.sh`
- Estrutura mínima para dados:
  - `data/raw/natality_2024/`
  - `data/processed/`

## Observações

Os microdados brutos, bases Parquet, saídas geradas e modelos treinados não estão versionados no GitHub.

A proxy RPM/PPROM utilizada no estudo é uma aproximação operacional retrospectiva e não deve ser interpretada como diagnóstico clínico individual ou ferramenta assistencial prospectiva.
