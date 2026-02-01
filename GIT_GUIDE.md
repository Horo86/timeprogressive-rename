# Guida Git per Time Progressive Rename

## Prerequisiti

1. Git deve essere installato sul tuo sistema:
```bash
sudo pacman -S git
```

2. Configura Git con il tuo nome e email (fallo solo la prima volta):
```bash
git config --global user.name "Il Tuo Nome"
git config --global user.email "tua.email@esempio.com"
```

## Passo 1: Inizializzare il repository locale

Nella cartella del progetto, esegui:

```bash
cd /percorso/a/timeprogressive-rename
git init
```

Questo crea un repository Git locale nella cartella.

## Passo 2: Aggiungere i file al repository

```bash
# Aggiungi tutti i file al staging
git add .

# Verifica quali file sono stati aggiunti
git status

# Crea il primo commit
git commit -m "Initial commit: Time Progressive Rename v1.0.0"
```

## Passo 3: Creare un repository su GitHub

1. Vai su https://github.com
2. Clicca sul pulsante "+" in alto a destra
3. Seleziona "New repository"
4. Compila i campi:
   - **Repository name**: `timeprogressive-rename`
   - **Description**: "Script Python per rinominare file con numerazione progressiva basata su data"
   - **Public/Private**: Scegli se vuoi che sia pubblico o privato
   - ⚠️ **NON** selezionare "Initialize this repository with a README" (ne hai già uno)
   - ⚠️ **NON** aggiungere .gitignore o license (li hai già)
5. Clicca "Create repository"

## Passo 4: Collegare il repository locale a GitHub

GitHub ti mostrerà delle istruzioni. Usa queste per collegare il tuo repo locale:

```bash
# Aggiungi il repository remoto (sostituisci 'tuousername' con il tuo username GitHub)
git remote add origin https://github.com/tuousername/timeprogressive-rename.git

# Verifica che il remote sia stato aggiunto correttamente
git remote -v

# Rinomina il branch principale in 'main' (se necessario)
git branch -M main

# Carica il codice su GitHub
git push -u origin main
```

La prima volta che fai push, GitHub ti chiederà di autenticarti.

## Passo 5: Autenticazione GitHub

GitHub non supporta più password dalla linea di comando. Hai due opzioni:

### Opzione A: Personal Access Token (Consigliato)

1. Vai su GitHub.com → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Clicca "Generate new token (classic)"
3. Dai un nome al token (es. "timeprogressive-rename-dev")
4. Seleziona lo scope: `repo` (accesso completo ai repository)
5. Clicca "Generate token"
6. **IMPORTANTE**: Copia il token subito (non lo vedrai più!)
7. Quando fai `git push`, usa il token come password

### Opzione B: SSH Key

1. Genera una chiave SSH:
```bash
ssh-keygen -t ed25519 -C "tua.email@esempio.com"
```

2. Aggiungi la chiave all'agent SSH:
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

3. Copia la chiave pubblica:
```bash
cat ~/.ssh/id_ed25519.pub
```

4. Vai su GitHub.com → Settings → SSH and GPG keys → New SSH key
5. Incolla la chiave e salvala
6. Cambia l'URL del repository in SSH:
```bash
git remote set-url origin git@github.com:tuousername/timeprogressive-rename.git
```

## Comandi Git utili per il futuro

### Fare modifiche e aggiornarle su GitHub

```bash
# Dopo aver modificato dei file
git status                    # Vedi quali file sono cambiati
git add .                     # Aggiungi tutti i file modificati
git commit -m "Descrizione delle modifiche"
git push                      # Carica su GitHub
```

### Vedere la cronologia dei commit

```bash
git log                       # Cronologia completa
git log --oneline            # Cronologia compatta
```

### Creare un branch per nuove funzionalità

```bash
git checkout -b nome-feature  # Crea e passa a un nuovo branch
# ... fai modifiche ...
git add .
git commit -m "Aggiunta nuova feature"
git push -u origin nome-feature

# Quando hai finito, torna al main e fai merge
git checkout main
git merge nome-feature
git push
```

### Vedere le differenze

```bash
git diff                      # Modifiche non ancora in staging
git diff --staged            # Modifiche in staging
```

### Annullare modifiche

```bash
git checkout -- file.txt     # Annulla modifiche a un file
git reset HEAD file.txt      # Rimuovi file dallo staging
git reset --soft HEAD~1      # Annulla ultimo commit (mantiene modifiche)
git reset --hard HEAD~1      # Annulla ultimo commit (ELIMINA modifiche!)
```

## Workflow tipico

1. Modifica i file nel tuo editor (Kate)
2. `git status` - Vedi cosa hai cambiato
3. `git add .` - Aggiungi le modifiche
4. `git commit -m "Descrizione chiara della modifica"`
5. `git push` - Carica su GitHub

## Consigli per i commit message

✅ **Buoni esempi:**
- "Fix: Corretto bug nella gestione dei conflitti"
- "Feature: Aggiunto supporto per estensioni case-sensitive"
- "Docs: Aggiornato README con nuovi esempi"
- "Refactor: Migliorata leggibilità funzione rename_files"

❌ **Cattivi esempi:**
- "fix"
- "modifiche"
- "aggiornamento"
- "aaaa"

## Risorse utili

- Git cheat sheet: https://education.github.com/git-cheat-sheet-education.pdf
- Pro Git book (gratuito): https://git-scm.com/book/en/v2
- GitHub Docs: https://docs.github.com

## Struttura del tuo progetto su GitHub

Una volta caricato, il tuo repository avrà questa struttura:

```
https://github.com/tuousername/timeprogressive-rename/
├── README.md (mostrato automaticamente nella home)
├── LICENSE
├── .gitignore
├── timeprogressive-rename
└── examples/
    └── test_files/
```

Il README.md verrà renderizzato automaticamente nella pagina principale del repo!
