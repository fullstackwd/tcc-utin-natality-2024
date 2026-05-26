#!/usr/bin/env bash
set -euo pipefail

mkdir -p logs

echo "Executando notebook 01 — preparo reprodutível..."
jupyter nbconvert --to notebook --execute notebooks/01_preparo_reprodutivel_natality_data_2024.ipynb \
  --output-dir logs \
  --output 01_preparo_executado.ipynb \
  --ExecutePreprocessor.timeout=-1

echo "Executando notebook 02 — pipeline analítico..."
jupyter nbconvert --to notebook --execute notebooks/02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb \
  --output-dir logs \
  --output 02_pipeline_executado.ipynb \
  --ExecutePreprocessor.timeout=-1

echo "Execução concluída. Verifique logs/, outputs/ e dados_finais/."
