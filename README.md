# Estratificação retrospectiva do risco de internação em UTIN — Natality Data 2024

Repositório técnico do TCC **“Estratificação retrospectiva do risco de internação em UTIN em nascimentos: aplicação de Health Analytics à Natality Data 2024, com ênfase em prematuridade e proxy operacional compatível com contexto de RPM/PPROM”**, desenvolvido no Bacharelado em Ciência de Dados da UNIVESP.

O projeto organiza um pipeline reprodutível em Python para preparo, auditoria e análise retrospectiva de microdados públicos da **Natality Data 2024**, com foco em:

- internação em Unidade de Terapia Intensiva Neonatal (`AB_NICU`);
- prematuridade;
- construção de proxy operacional compatível com contexto de RPM/PPROM;
- análise exploratória;
- regressão logística;
- Random Forest;
- XGBoost;
- calibração, limiares e explicabilidade;
- comparação entre cenário completo/perinatal e cenário restritivo para controle metodológico de possível vazamento temporal.

> **Aviso metodológico:** a proxy RPM/PPROM usada no projeto é uma aproximação operacional retrospectiva. Ela não representa diagnóstico clínico individual, não mede prevalência real de RPM/PPROM e não deve ser usada como ferramenta assistencial prospectiva.

---

## Estrutura da pasta

```text
.
├── README.md
├── LICENSE
├── CITATION.cff
├── requirements.txt
├── environment.yml
├── .gitignore
├── .gitattributes
├── data/
│   ├── README.md
│   ├── raw/
│   ├── interim/
│   └── processed/
├── docs/
│   ├── TCC_final.docx
│   └── referencias/
│       └── UserGuide2024_Natality_Public_Use_File.pdf
├── notebooks/
│   ├── 01_preparo_reprodutivel_natality_data_2024.ipynb
│   └── 02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb
├── scripts/
│   ├── 01_preparo_reprodutivel_natality_data_2024.py
│   ├── 02_pipeline_analitico_reprodutivel_natality_data_2024.py
│   └── run_notebooks.sh
├── results/
│   ├── figures/
│   ├── models/
│   └── tables/
├── reports/
└── logs/
```

---

## Como reproduzir

### 1. Criar o ambiente

Com `venv`:

```bash
python -m venv .venv
source .venv/bin/activate  # Linux/macOS
# .venv\Scripts\activate   # Windows PowerShell
pip install --upgrade pip
pip install -r requirements.txt
```

Ou com Conda/Mamba:

```bash
conda env create -f environment.yml
conda activate tcc-utin-rpm-pprom
```

### 2. Preparar os dados

Execute o notebook 01:

```bash
jupyter notebook notebooks/01_preparo_reprodutivel_natality_data_2024.ipynb
```

O notebook 01 baixa/processa o arquivo público da Natality 2024, gera o Parquet intermediário e salva artefatos de auditoria. A saída principal esperada é:

```text
data/processed/natality_data_2024.parquet
```

### 3. Executar a análise

Depois de gerar o Parquet, execute o notebook 02:

```bash
jupyter notebook notebooks/02_pipeline_analitico_reprodutivel_natality_data_2024.ipynb
```

Esse notebook gera tabelas, gráficos, métricas, artefatos de conferência e arquivos consolidados de resultados.

### 4. Execução automatizada opcional

```bash
bash scripts/run_notebooks.sh
```

---

## Notas sobre dados

Os microdados brutos e arquivos derivados grandes **não foram incluídos no repositório**. A pasta `data/` contém apenas subpastas e instruções para reprodução. Isso evita versionar arquivos pesados e mantém o repositório adequado para GitHub.

Antes de publicar o repositório como público, revise o arquivo `docs/TCC_final.docx`, pois ele contém identificação acadêmica dos autores conforme o documento original do TCC.

---

## Principais artefatos esperados

O pipeline pode gerar, entre outros:

- `natality_data_2024.parquet`;
- `base_analitica_tcc_utin_rpm_pprom.parquet`;
- `resultados_tcc_pipeline_completo.xlsx`;
- tabelas CSV de completude, regressões, métricas e importância de variáveis;
- gráficos PNG das análises exploratórias, curvas ROC, Precision-Recall, calibração e importância de variáveis;
- manifesto/checklist de reprodutibilidade;
- relatório de ambiente de execução.

---

## Limites de uso

Este projeto é destinado a fins acadêmicos, metodológicos e reprodutíveis. Os modelos não devem ser interpretados como dispositivo médico, ferramenta clínica, sistema de triagem real ou recomendação assistencial individual.

A aplicação em contexto brasileiro, como SINASC/DATASUS, exigiria adaptação de variáveis, validação externa, análise de equidade, avaliação prospectiva e discussão institucional.

---

## Citação sugerida

SANTOS, Jalvo Alef Oliveira dos; VILELA, Vanessa Soares; RIBEIRO, Julia Beatriz Valentim; SORGI, Vanessa Beatriz Mauricio; CALÇADA, David Paulo Francisco; OLIVEIRA, José Paulo da Silva; SANTOS, Lucas Gabriel Gallo dos; LIMA, Wagner Santos. **Estratificação retrospectiva do risco de internação em UTIN em nascimentos: aplicação de Health Analytics à Natality Data 2024, com ênfase em prematuridade e proxy operacional compatível com contexto de RPM/PPROM**. Trabalho de Conclusão de Curso, Bacharelado em Ciência de Dados, UNIVESP, 2026.
