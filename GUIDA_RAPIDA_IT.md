# Time Progressive Rename - Guida Rapida Italiana

## 🎉 Il tuo progetto è pronto!

Hai ora un progetto Python completo e professionale per rinominare file con numerazione progressiva basata sulla data.

## 📦 Cosa hai ricevuto

Il progetto è composto da:

1. **timeprogressive-rename** - Lo script Python principale (eseguibile)
2. **README.md** - Documentazione completa del progetto (in inglese)
3. **EXAMPLES.md** - Esempi pratici d'uso
4. **TESTING.md** - Guida per testare lo script
5. **GIT_GUIDE.md** - Guida Git per principianti
6. **LICENSE** - Licenza MIT
7. **.gitignore** - File da ignorare in Git
8. **examples/test_files/** - Cartella con file di test

## 🚀 Come iniziare

### 1. Copia il progetto sul tuo PC Arch Linux

Scarica la cartella `timeprogressive-rename` che ti ho preparato e copiala dove preferisci, ad esempio:

```bash
# Supponiamo tu l'abbia scaricata in ~/Download
mv ~/Download/timeprogressive-rename ~/Progetti/

cd ~/Progetti/timeprogressive-rename
```

### 2. Rendi lo script eseguibile

```bash
chmod +x timeprogressive-rename
```

### 3. (Opzionale) Installa lo script a livello di sistema

Se vuoi usarlo da qualsiasi cartella senza scrivere il percorso completo:

```bash
sudo cp timeprogressive-rename /usr/local/bin/
```

Oppure, se preferisci non usare sudo, puoi aggiungerlo al tuo PATH personale:

```bash
mkdir -p ~/.local/bin
cp timeprogressive-rename ~/.local/bin/
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### 4. Prova lo script!

```bash
# Vai nella cartella di test
cd examples/test_files/

# Esegui lo script
../../timeprogressive-rename jpg

# Quando richiesto, inserisci un prefisso, ad esempio: foto_test
# Controlla l'anteprima
# Rispondi N per annullare o Y per eseguire
```

## 📝 Uso Quotidiano

### Esempio: Rinominare le foto delle vacanze

```bash
# Vai nella cartella con le foto
cd ~/Immagini/vacanza_2024/

# Esegui lo script
timeprogressive-rename jpg jpeg

# Inserisci prefisso: vacanza_mare
# Controlla anteprima
# Conferma con Y
```

### Esempio: Rinominare screenshot

```bash
cd ~/Immagini/Screenshot/
timeprogressive-rename png
# Prefisso: screen
```

## 🌟 Caratteristiche Principali

- ✨ **Ordinamento automatico** per data di creazione/modifica
- 🎨 **Interfaccia colorata** nel terminale
- 👁️ **Anteprima** prima di modificare i file
- 🔒 **Gestione sicura** dei conflitti di nome
- 🔤 **Case-insensitive** per le estensioni
- 📊 **Statistiche** al termine dell'operazione

## 🐙 Caricamento su GitHub

### Prima volta che usi Git?

1. **Installa Git** (se non ce l'hai già):
```bash
sudo pacman -S git
```

2. **Configura Git** (solo la prima volta):
```bash
git config --global user.name "Il Tuo Nome"
git config --global user.email "tua.email@esempio.com"
```

### Carica il progetto su GitHub

Il repository Git è già pronto! Segui questi passaggi:

1. **Vai su GitHub.com** e crea un account (se non ce l'hai)

2. **Crea un nuovo repository**:
   - Clicca sul "+" in alto a destra → "New repository"
   - Nome: `timeprogressive-rename`
   - Descrizione: "Script Python per rinominare file con numerazione progressiva"
   - **NON** selezionare "Initialize with README" (ce l'hai già!)
   - Clicca "Create repository"

3. **Collega il tuo repository locale a GitHub**:
```bash
cd ~/Progetti/timeprogressive-rename

# Sostituisci 'tuousername' con il tuo username GitHub
git remote add origin https://github.com/tuousername/timeprogressive-rename.git

# Carica il codice
git push -u origin main
```

4. **Autenticazione**:
   - GitHub ti chiederà username e password
   - **IMPORTANTE**: Non puoi più usare la password normale!
   - Devi creare un **Personal Access Token**:
     - Vai su GitHub.com → Settings → Developer settings
     - Personal access tokens → Tokens (classic)
     - Generate new token (classic)
     - Seleziona "repo"
     - Copia il token
     - Usalo al posto della password quando fai push

### Futuri aggiornamenti

Quando modifichi il codice:

```bash
# Vedi cosa hai modificato
git status

# Aggiungi le modifiche
git add .

# Committa con un messaggio descrittivo
git commit -m "Fix: Corretto bug nella gestione dei conflitti"

# Carica su GitHub
git push
```

## 📖 Documentazione Completa

Leggi i file di documentazione per saperne di più:

- **README.md** - Documentazione completa con tutti i dettagli tecnici
- **EXAMPLES.md** - 6 scenari d'uso pratici con comandi completi
- **TESTING.md** - Come testare lo script in sicurezza
- **GIT_GUIDE.md** - Tutto su Git e GitHub per principianti

## 🔧 Personalizzazioni

Vuoi modificare lo script? Apri `timeprogressive-rename` con Kate:

```bash
kate timeprogressive-rename
```

Il codice è ben commentato e diviso in funzioni chiare. Alcune cose che potresti voler modificare:

- **Numero di cifre** nella numerazione (attualmente 3: 001, 002, ecc.)
  - Cerca: `f"{index:03d}"` e cambia `03` con il numero di cifre desiderato

- **Separatore** tra prefisso e numero (attualmente "_")
  - Cerca: `f"{prefix}_{number}{extension}"` e cambia `_` con ciò che preferisci

- **Colori** del terminale
  - Modifica la classe `Colors` all'inizio del file

## ⚠️ Raccomandazioni di Sicurezza

1. **Fai sempre un backup** prima di rinominare file importanti
2. **Controlla l'anteprima** attentamente
3. **Testa prima** in una cartella di prova
4. **Non usare su file di sistema** (solo sui tuoi documenti personali)

## 🆘 Aiuto e Supporto

Se hai problemi:

1. Consulta **TESTING.md** per verificare che tutto funzioni
2. Rileggi **EXAMPLES.md** per vedere se il tuo caso d'uso è coperto
3. Controlla la sezione FAQ nel README.md
4. Se hai caricato il progetto su GitHub, puoi aprire una "Issue"

## 🎓 Imparare Python

Questo progetto è un ottimo punto di partenza per imparare Python! Il codice include:

- ✅ Gestione argomenti da linea di comando (`argparse`)
- ✅ Manipolazione file e cartelle (`pathlib`)
- ✅ Ordinamento e liste
- ✅ Gestione errori (`try/except`)
- ✅ Funzioni ben strutturate
- ✅ Documentazione completa
- ✅ Colori nel terminale

Studia il codice, modificalo, sperimenta!

## 📜 Licenza

Il progetto usa la licenza MIT - puoi fare praticamente tutto ciò che vuoi con questo codice!

## ✨ Prossimi Passi

1. ✅ Testa lo script con i file di esempio
2. ✅ Usalo su un piccolo set di file reali (con backup!)
3. ✅ Carica il progetto su GitHub
4. ✅ Personalizza secondo le tue esigenze
5. ✅ Condividi con altri (se vuoi)!

---

**Buon divertimento con il tuo nuovo strumento!** 🚀

Se hai domande o problemi, non esitare a chiedere.
