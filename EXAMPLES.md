# Esempi Pratici di Utilizzo

Questa guida mostra esempi concreti di come usare `timeprogressive-rename` in vari scenari.

## Scenario 1: Rinominare foto delle vacanze

Hai una cartella con foto scattate in date diverse durante una vacanza:

```
foto/
├── IMG_20240701_143022.jpg
├── IMG_20240702_091533.jpg
├── IMG_20240702_183044.jpg
├── DCIM_0001.jpg
└── DCIM_0002.jpg
```

**Comando:**
```bash
cd foto
timeprogressive-rename jpg
```

**Input richiesto:**
```
Inserisci il prefisso da usare: vacanza_mare
```

**Risultato:**
```
vacanza_mare_001.jpg  (foto più vecchia)
vacanza_mare_002.jpg
vacanza_mare_003.jpg
vacanza_mare_004.jpg
vacanza_mare_005.jpg  (foto più recente)
```

---

## Scenario 2: Organizzare screenshot

Hai molti screenshot con nomi casuali:

```
screenshot/
├── Screenshot from 2024-01-15 10-23-45.png
├── Schermata del 2024-01-16 alle 14.30.22.png
├── Screenshot_20240117_093011.png
└── capture.png
```

**Comando:**
```bash
cd screenshot
timeprogressive-rename png
```

**Input richiesto:**
```
Inserisci il prefisso da usare: screen
```

**Risultato:**
```
screen_001.png
screen_002.png
screen_003.png
screen_004.png
```

---

## Scenario 3: Rinominare video di un evento

Hai video girati con diversi dispositivi durante un evento:

```
evento/
├── VID_20240320_100530.mp4
├── video(1).mp4
├── MVI_2034.MOV
├── recording_001.MP4
└── clip.avi
```

**Comando:**
```bash
cd evento
timeprogressive-rename mp4 mov avi
```

**Input richiesto:**
```
Inserisci il prefisso da usare: conferenza_2024
```

**Risultato:**
```
conferenza_2024_001.mp4
conferenza_2024_002.mp4
conferenza_2024_003.MOV   (mantiene l'estensione originale)
conferenza_2024_004.MP4
conferenza_2024_005.avi
```

---

## Scenario 4: Organizzare documenti scansionati

Hai scansioni di documenti in vari formati:

```
scansioni/
├── scan0001.pdf
├── documento.PDF
├── scansione (1).pdf
├── doc_001.jpg
└── img_2024.jpeg
```

**Comando:**
```bash
cd scansioni
timeprogressive-rename pdf jpg jpeg
```

**Input richiesto:**
```
Inserisci il prefisso da usare: contratto_acquisto
```

**Risultato:**
```
contratto_acquisto_001.pdf
contratto_acquisto_002.PDF
contratto_acquisto_003.pdf
contratto_acquisto_004.jpg
contratto_acquisto_005.jpeg
```

---

## Scenario 5: Rinominare file audio

Hai registrazioni audio di lezioni o podcast:

```
audio/
├── Recording (1).m4a
├── Recording (2).m4a
├── voice_memo_20240115.mp3
└── audio_20240116.wav
```

**Comando:**
```bash
cd audio
timeprogressive-rename mp3 m4a wav
```

**Input richiesto:**
```
Inserisci il prefisso da usare: lezione_python
```

**Risultato:**
```
lezione_python_001.m4a
lezione_python_002.m4a
lezione_python_003.mp3
lezione_python_004.wav
```

---

## Scenario 6: Workflow completo con anteprima

Esempio completo di una sessione interattiva:

```bash
$ cd ~/Downloads/foto_compleanno
$ timeprogressive-rename jpg jpeg

================================================================================
TIME PROGRESSIVE RENAME
================================================================================

Directory: /home/user/Downloads/foto_compleanno
Estensioni: jpg, jpeg

Ricerca file in corso...
✓ Trovati 12 file

Inserisci il prefisso da usare: compleanno_2024

================================================================================
ANTEPRIMA OPERAZIONI DI RINOMINA
================================================================================

N°    Data Creazione/Modifica Nome Originale            →   Nuovo Nome               
--------------------------------------------------------------------------------
1     2024-03-15 18:30:45    IMG_0001.jpg              →   compleanno_2024_001.jpg  
2     2024-03-15 18:31:12    IMG_0002.jpg              →   compleanno_2024_002.jpg  
3     2024-03-15 18:35:03    DSC_1234.jpeg             →   compleanno_2024_003.jpeg 
4     2024-03-15 18:42:56    foto_torta.jpg            →   compleanno_2024_004.jpg  
5     2024-03-15 19:15:23    gruppo.JPG                →   compleanno_2024_005.JPG  
...

--------------------------------------------------------------------------------
Totale file da rinominare: 12
================================================================================

Procedere con la rinomina? (Y/N): Y

Esecuzione rinomina in corso...

✓ Rinominato: IMG_0001.jpg → compleanno_2024_001.jpg
✓ Rinominato: IMG_0002.jpg → compleanno_2024_002.jpg
✓ Rinominato: DSC_1234.jpeg → compleanno_2024_003.jpeg
...

================================================================================
STATISTICHE FINALI
================================================================================

✓ File rinominati con successo: 12
✓ Nessun errore

================================================================================
```

---

## Suggerimenti e Best Practices

### Prefissi consigliati

- **Date**: `2024_gennaio`, `2024-01-15`
- **Eventi**: `matrimonio_luca`, `conferenza_ai`
- **Progetti**: `progetto_tesi`, `sito_web`
- **Categorie**: `fatture_2024`, `ricevute_gennaio`

### Prima di iniziare

1. **Fai sempre un backup** prima di rinominare molti file importanti
2. **Controlla l'anteprima** attentamente prima di confermare
3. **Usa prefissi descrittivi** che rendano facile identificare i file
4. **Testa prima** con pochi file in una cartella di prova

### Dopo la rinomina

Se hai rinominato file per errore, puoi:
1. Annullare l'operazione con `Ctrl+Z` se hai fatto il backup
2. Usare lo script di nuovo con un prefisso diverso
3. Rinominare manualmente se sono pochi file

---

## Integrazione con altri strumenti

### Usare con find per selezionare file specifici

Prima sposta i file che vuoi rinominare in una cartella temporanea:

```bash
# Trova e sposta solo le foto più grandi di 1MB
find . -name "*.jpg" -size +1M -exec mv {} temp_folder/ \;

# Ora rinomina
cd temp_folder
timeprogressive-rename jpg
```

### Creare uno script wrapper

Puoi creare uno script bash personalizzato che combina operazioni:

```bash
#!/bin/bash
# rename_and_move.sh

# Rinomina
timeprogressive-rename jpg jpeg png

# Sposta in una cartella archive
mkdir -p ../archive_$(date +%Y%m%d)
mv *.jpg *.jpeg *.png ../archive_$(date +%Y%m%d)/
```

---

## Troubleshooting

### Problema: "Nessun file trovato"
**Soluzione**: Verifica di essere nella cartella corretta e che le estensioni siano scritte correttamente (senza punto).

### Problema: Lo script non si avvia
**Soluzione**: Assicurati che lo script sia eseguibile:
```bash
chmod +x timeprogressive-rename
```

### Problema: Errori di permessi
**Soluzione**: Verifica di avere i permessi di scrittura nella cartella:
```bash
ls -la
# Se necessario, cambia i permessi
chmod u+w *
```
