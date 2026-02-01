# Time Progressive Rename

Uno script Python per rinominare file in modo organizzato aggiungendo un prefisso personalizzato e un numero progressivo basato sulla data di creazione o modifica del file.

## Descrizione

`timeprogressive-rename` è uno strumento da linea di comando che permette di rinominare batch di file con estensioni specifiche, ordinandoli in base alla loro data di creazione (o modifica se la data di creazione non è disponibile) e aggiungendo una numerazione progressiva.

## Caratteristiche

- ✨ Rinomina multipli file con un singolo comando
- 📅 Ordinamento automatico per data di creazione/modifica
- 🎨 Interfaccia colorata e user-friendly nel terminale
- 👁️ Anteprima delle modifiche prima dell'esecuzione (dry run)
- 🔒 Gestione intelligente dei conflitti di nomi
- 🔤 Ricerca case-insensitive delle estensioni
- 📊 Statistiche dettagliate al termine dell'operazione

## Requisiti

- Python 3.6 o superiore
- Sistema operativo Linux

## Installazione

1. Clona questo repository:
```bash
git clone https://github.com/tuousername/timeprogressive-rename.git
cd timeprogressive-rename
```

2. Rendi lo script eseguibile:
```bash
chmod +x timeprogressive-rename
```

3. (Opzionale) Sposta lo script in una directory nel tuo PATH per usarlo ovunque:
```bash
sudo cp timeprogressive-rename /usr/local/bin/
```

## Utilizzo

### Sintassi base

```bash
./timeprogressive-rename <estensione1> [estensione2] [estensione3] ...
```

### Esempi

Rinominare tutti i file JPEG:
```bash
./timeprogressive-rename jpg jpeg
```

Rinominare file di immagini multiple:
```bash
./timeprogressive-rename jpg png gif webp
```

Rinominare file video:
```bash
./timeprogressive-rename mp4 avi mkv
```

### Funzionamento

1. **Avvio**: Esegui lo script nella cartella contenente i file da rinominare, specificando le estensioni
2. **Prefisso**: Lo script ti chiederà di inserire un prefisso (es: "vacanza", "foto", "documento")
3. **Anteprima**: Visualizzerai una tabella con:
   - Numero progressivo
   - Data di creazione/modifica
   - Nome originale del file
   - Nuovo nome proposto
4. **Conferma**: Rispondi Y per procedere, N per annullare
5. **Risultato**: Lo script esegue le rinominazioni e mostra le statistiche

### Formato del nome risultante

I file verranno rinominati seguendo questo schema:
```
<prefisso>_<numero>.<estensione>
```

Dove:
- `<prefisso>` è il testo inserito dall'utente
- `<numero>` è un numero progressivo a 3 cifre (001, 002, 003, ...)
- `.<estensione>` è l'estensione originale del file

**Esempio**:
```
Input: IMG_20240101.jpg, IMG_20240102.jpg, IMG_20240103.jpg
Prefisso: vacanza
Output: vacanza_001.jpg, vacanza_002.jpg, vacanza_003.jpg
```

## Dettagli tecnici

### Gestione della data

- Lo script utilizza la data di creazione del file quando disponibile
- Su filesystem ext4 e simili (dove la data di creazione potrebbe non essere disponibile), usa la data di modifica
- I file vengono ordinati in ordine cronologico crescente

### Gestione dei conflitti

Lo script gestisce automaticamente i conflitti di nomi:
1. Identifica i file che avrebbero lo stesso nome del target
2. Li rinomina temporaneamente
3. Esegue tutte le rinominazioni principali
4. Rinomina i file temporanei ai nomi finali

### Case sensitivity

Le estensioni sono trattate in modo case-insensitive:
- `.jpg`, `.JPG`, `.Jpg` sono tutte considerate uguali

## Struttura del progetto

```
timeprogressive-rename/
├── README.md              # Questo file
├── LICENSE                # Licenza del progetto
├── .gitignore            # File da ignorare in Git
├── timeprogressive-rename # Script principale
└── examples/
    └── test_files/       # File di esempio per testing
```

## Contribuire

I contributi sono benvenuti! Per contribuire:

1. Fai un fork del progetto
2. Crea un branch per la tua feature (`git checkout -b feature/nuova-funzionalita`)
3. Committa le modifiche (`git commit -am 'Aggiunge nuova funzionalità'`)
4. Pusha il branch (`git push origin feature/nuova-funzionalita`)
5. Apri una Pull Request

## Licenza

Questo progetto è rilasciato sotto licenza MIT. Vedi il file `LICENSE` per i dettagli.

## Autore

Il tuo nome

## Changelog

### Versione 1.0.0 (2026-02-01)
- Rilascio iniziale
- Rinominazione basata su data di creazione/modifica
- Supporto multi-estensione
- Anteprima interattiva
- Gestione conflitti nomi

## FAQ

**D: Lo script funziona in modo ricorsivo nelle sottocartelle?**  
R: No, lo script opera solo nella directory corrente.

**D: Posso annullare le modifiche dopo aver confermato?**  
R: No, per questo è importante verificare attentamente l'anteprima prima di confermare.

**D: Cosa succede se ci sono file con la stessa data?**  
R: I file con la stessa data mantengono un ordine deterministico basato sul loro ordine nel filesystem.

**D: Posso usare spazi nel prefisso?**  
R: Sì, il prefisso può contenere spazi e caratteri speciali.

## Supporto

Per bug, domande o suggerimenti, apri una issue su GitHub.
