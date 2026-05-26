# tcc-utin-natality-2024

Repositório mínimo para executar os notebooks do TCC sobre estratificação retrospectiva do risco de internação em UTIN com microdados públicos da Natality Data 2024.

Este pacote está focado somente nos requisitos de funcionamento dos notebooks:

- `01_preparo_reprodutivel_natality_data_2024.ipynb`
- `02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb`

## Estrutura

```text
.
├── README.md
├── requirements.txt
├── environment.yml
├── .gitignore
├── notebooks/
│   ├── 01_preparo_reprodutivel_natality_data_2024.ipynb
│   └── 02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb
├── scripts/
│   └── run_notebooks.sh
└── data/
    ├── README.md
    ├── raw/
    │   └── natality_2024/
    │       └── .gitkeep
    └── processed/
        └── .gitkeep
```

## Como instalar

Com `venv`:

```bash
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

No Windows PowerShell:

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

Com Conda/Mamba:

```bash
conda env create -f environment.yml
conda activate tcc-utin-natality-2024
```

## Como executar

Primeiro execute o notebook 01:

```bash
jupyter notebook notebooks/01_preparo_reprodutivel_natality_data_2024.ipynb
```

O notebook 01 prepara o arquivo:

```text
data/processed/natality_data_2024.parquet
```

Depois execute o notebook 02:

```bash
jupyter notebook notebooks/02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb
```

Também é possível executar os dois notebooks em sequência:

```bash
bash scripts/run_notebooks.sh
```

## Dados

Os microdados brutos e arquivos derivados grandes não estão versionados no GitHub.

Coloque os arquivos brutos, quando necessário, em:

```text
data/raw/natality_2024/
```

O arquivo processado esperado pelo notebook 02 é:

```text
data/processed/natality_data_2024.parquet
```

## Saídas geradas

Durante a execução, os notebooks podem criar pastas como:

```text
outputs/
dados_brutos/
dados_intermediarios/
dados_finais/
logs/
```

Essas pastas são ignoradas pelo Git porque são resultados gerados localmente.

## Aviso metodológico

A proxy RPM/PPROM usada no projeto é uma aproximação operacional retrospectiva. Ela não representa diagnóstico clínico individual, não mede prevalência real de RPM/PPROM e não deve ser usada como ferramenta assistencial prospectiva.
