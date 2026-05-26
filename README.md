# tcc-utin-natality-2024

Repositório mínimo para executar os notebooks do TCC sobre **estratificação retrospectiva do risco de internação em UTIN** com microdados públicos da **Natality Data 2024**.

Este repositório está focado somente nos requisitos de funcionamento dos notebooks:

- `01_preparo_reprodutivel_natality_data_2024.ipynb`
- `02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb`

O objetivo é permitir que outra pessoa consiga preparar os dados, executar a análise e gerar os artefatos locais sem versionar bases grandes, modelos treinados ou arquivos de saída.

---

## Requisitos

Ambiente recomendado:

```text
Python >=3.11,<3.14
```

O projeto foi organizado para execução local em Windows, Linux ou macOS. Em Windows, recomenda-se usar PowerShell, Git Bash, WSL ou Conda/Mamba.

As dependências estão no arquivo:

```text
requirements.txt
```

Principais grupos de dependências:

- execução de notebooks: `ipykernel`, `nbformat`, `nbconvert`, `notebook`;
- preparo de dados: `numpy`, `pandas`, `pyarrow`, `requests`, `zipfile-deflate64`;
- análise e visualização: `matplotlib`;
- modelagem: `scikit-learn`, `xgboost`, `statsmodels`;
- exportação e diagramas: `openpyxl`, `graphviz`.

> Observação: `zipfile-deflate64` é necessário apenas se o arquivo ZIP original exigir suporte a Deflate64. Mantê-lo no ambiente evita erro de extração em alguns sistemas.

---

## Estrutura da pasta

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

---

## Instalação com `venv`

### Linux/macOS

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
```

### Windows PowerShell

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
pip install -r requirements.txt
```

Caso o PowerShell bloqueie a ativação do ambiente, execute:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.venv\Scripts\Activate.ps1
```

---

## Instalação com Conda/Mamba

```bash
conda env create -f environment.yml
conda activate tcc-utin-natality-2024
```

Ou, com Mamba:

```bash
mamba env create -f environment.yml
mamba activate tcc-utin-natality-2024
```

---

## Como executar os notebooks

### 1. Executar o notebook 01

```bash
jupyter notebook notebooks/01_preparo_reprodutivel_natality_data_2024.ipynb
```

O notebook 01 prepara os dados e deve gerar o arquivo processado:

```text
data/processed/natality_data_2024.parquet
```

### 2. Executar o notebook 02

Depois que o arquivo processado existir, execute:

```bash
jupyter notebook notebooks/02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb
```

O notebook 02 usa o Parquet gerado pelo notebook 01 para executar as análises exploratórias, regressões, modelos supervisionados, métricas, gráficos e tabelas.

### 3. Execução automatizada opcional

Também é possível executar os dois notebooks em sequência:

```bash
bash scripts/run_notebooks.sh
```

Em Windows, use Git Bash, WSL ou Conda Prompt para rodar o script `.sh`.

---

## Dados esperados

Os microdados brutos e arquivos derivados grandes **não são versionados no GitHub**.

Quando necessário, coloque os arquivos brutos em:

```text
data/raw/natality_2024/
```

O arquivo processado esperado pelo notebook 02 é:

```text
data/processed/natality_data_2024.parquet
```

Se esse arquivo não existir, execute primeiro o notebook 01.

---

## Saídas geradas localmente

Durante a execução, os notebooks podem criar pastas como:

```text
outputs/
dados_brutos/
dados_intermediarios/
dados_finais/
logs/
```

Essas pastas são resultados locais e devem permanecer fora do versionamento Git.

O `.gitignore` deve ignorar, entre outros:

```text
*.parquet
*.zip
*.csv
*.xlsx
*.pkl
*.joblib
outputs/
dados_brutos/
dados_intermediarios/
dados_finais/
logs/
```

---

## O que não está neste repositório

Este repositório não inclui:

- microdados brutos da Natality Data 2024;
- arquivos Parquet processados;
- planilhas, gráficos e tabelas gerados;
- modelos treinados;
- arquivos grandes de saída;
- versão completa do TCC, salvo decisão explícita dos autores.

A reprodução deve ser feita localmente a partir dos notebooks.

---

## Ordem correta de uso

```text
1. Criar ambiente Python
2. Instalar requirements.txt
3. Colocar dados brutos em data/raw/natality_2024/, se necessário
4. Executar notebook 01
5. Confirmar geração de data/processed/natality_data_2024.parquet
6. Executar notebook 02
7. Conferir saídas em outputs/ e dados_finais/
```

---

## Problemas comuns

### Erro: arquivo Parquet não encontrado

Execute primeiro o notebook 01 e confirme se o arquivo abaixo foi criado:

```text
data/processed/natality_data_2024.parquet
```

### Erro ao extrair ZIP

Instale ou reinstale:

```bash
pip install zipfile-deflate64
```

### Erro relacionado ao Graphviz

O pacote Python `graphviz` pode exigir o executável Graphviz instalado no sistema operacional para renderizar alguns diagramas.

Se a renderização falhar, o notebook pode usar alternativa com Matplotlib, quando disponível.

### Erro com XGBoost/GPU

O pipeline pode ser executado em CPU. GPU não é obrigatória para funcionamento geral dos notebooks.

---

## Aviso metodológico

A proxy RPM/PPROM usada no projeto é uma aproximação operacional retrospectiva. Ela não representa diagnóstico clínico individual, não mede prevalência real de RPM/PPROM e não deve ser usada como ferramenta assistencial prospectiva.

Os modelos e resultados têm finalidade acadêmica, metodológica e reprodutível. Eles não devem ser interpretados como dispositivo médico, ferramenta clínica, sistema de triagem real ou recomendação assistencial individual.

---

## Licença e citação

Caso o repositório seja tornado público, recomenda-se incluir um arquivo `LICENSE` e, se desejado, um `CITATION.cff`.

Antes de publicar documentos acadêmicos completos, revise a presença de nomes, RAs e demais informações pessoais dos autores.
