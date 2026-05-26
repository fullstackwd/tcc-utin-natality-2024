# Comandos para aplicar os ajustes localmente

Execute dentro da pasta do repositório clonado:

```bash
git pull origin main

# Copie os arquivos LICENSE e RELEASE_NOTES_v1.0.0-tcc.md para a raiz do repositório.

git add LICENSE RELEASE_NOTES_v1.0.0-tcc.md README.md requirements.txt environment.yml .gitignore
git commit -m "docs: professionalize repository metadata and release notes"
git push origin main
```

## Criar tag da release pelo terminal

```bash
git tag -a v1.0.0-tcc -m "v1.0.0-tcc — versão acadêmica inicial"
git push origin v1.0.0-tcc
```

Depois, no GitHub:

1. Vá em **Releases**.
2. Clique em **Draft a new release**.
3. Selecione a tag `v1.0.0-tcc`.
4. Use o título `v1.0.0-tcc — versão acadêmica inicial`.
5. Cole o conteúdo de `RELEASE_NOTES_v1.0.0-tcc.md`.
6. Publique a release.
```
