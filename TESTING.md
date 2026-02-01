# Guida al Testing

Questa guida ti aiuta a testare `timeprogressive-rename` prima di usarlo sui tuoi file reali.

## Test Rapido

Abbiamo già preparato dei file di test nella cartella `examples/test_files/`:

```bash
cd examples/test_files/
../../timeprogressive-rename jpg
```

Quando richiesto, inserisci un prefisso come `foto_test` e controlla l'anteprima.
Rispondi `N` per annullare o `Y` per eseguire la rinomina.

## Creare il Proprio Ambiente di Test

### Opzione 1: Cartella di test con file fittizi

```bash
# Crea una cartella di test
mkdir ~/test_rename
cd ~/test_rename

# Crea alcuni file di test con timestamp diversi
touch -t 202401011200 file1.jpg
sleep 1
touch -t 202401021200 file2.jpg
sleep 1
touch -t 202401031200 file3.JPG
sleep 1
touch -t 202401041200 document.txt

# Testa lo script
timeprogressive-rename jpg txt
```

### Opzione 2: Copia di file reali

```bash
# Crea una cartella di test
mkdir ~/test_rename
cd ~/test_rename

# Copia alcuni file reali (COPIA, non spostare!)
cp ~/Immagini/foto*.jpg .

# Testa lo script
timeprogressive-rename jpg
```

## Test Specifici

### Test 1: Case Insensitivity

Verifica che lo script trovi file con estensioni maiuscole/minuscole:

```bash
mkdir test_case
cd test_case
touch file1.jpg file2.JPG file3.Jpg
timeprogressive-rename jpg
# Dovrebbe trovare tutti e 3 i file
```

### Test 2: Multi-estensione

Verifica che funzioni con più estensioni:

```bash
mkdir test_multi
cd test_multi
touch img1.jpg img2.png doc1.pdf
timeprogressive-rename jpg png pdf
# Dovrebbe trovare tutti i file
```

### Test 3: Ordinamento per data

Verifica l'ordinamento corretto:

```bash
mkdir test_order
cd test_order

# Crea file con date specifiche (formato: YYYYMMDDhhmm)
touch -t 202403011200 newer.jpg
touch -t 202301011200 older.jpg
touch -t 202302011200 middle.jpg

timeprogressive-rename jpg
# L'ordine dovrebbe essere: older (001), middle (002), newer (003)
```

### Test 4: Gestione conflitti

Verifica la gestione dei conflitti di nome:

```bash
mkdir test_conflict
cd test_conflict

# Crea file che potrebbero avere conflitti
touch file1.jpg file2.jpg
# Crea già un file con il nome target
touch test_001.jpg

# Testa con prefisso "test"
timeprogressive-rename jpg
# Tutti i file dovrebbero essere rinominati correttamente
```

### Test 5: Nessun file trovato

Verifica il comportamento quando non ci sono file:

```bash
mkdir test_empty
cd test_empty
timeprogressive-rename jpg
# Dovrebbe mostrare messaggio che non ci sono file
```

### Test 6: Solo sottocartelle

Verifica che NON rinomini file nelle sottocartelle:

```bash
mkdir test_subdir
cd test_subdir
touch file1.jpg
mkdir subdir
touch subdir/file2.jpg

timeprogressive-rename jpg
# Dovrebbe trovare solo file1.jpg, non file2.jpg
```

## Checklist di Test Completa

Prima di usare lo script su file importanti, verifica:

- [ ] Lo script trova correttamente i file con le estensioni specificate
- [ ] L'ordinamento per data funziona correttamente
- [ ] L'anteprima mostra i nomi corretti
- [ ] La conferma Y/N funziona
- [ ] I file vengono effettivamente rinominati quando confermi
- [ ] Le statistiche finali sono corrette
- [ ] Non ci sono errori nel terminale
- [ ] I file nelle sottocartelle NON vengono toccati
- [ ] Le estensioni maiuscole/minuscole sono gestite correttamente

## Test Automatizzato (Bash Script)

Puoi creare uno script per testare automaticamente:

```bash
#!/bin/bash
# test_script.sh

echo "=== Test Time Progressive Rename ==="

# Setup
TEST_DIR="/tmp/test_rename_$$"
mkdir -p "$TEST_DIR"
cd "$TEST_DIR"

# Crea file di test
echo "Creazione file di test..."
touch -t 202301011200 old.jpg
touch -t 202302011200 middle.jpg
touch -t 202303011200 new.jpg
touch other.txt

# Test 1: Trova solo jpg
echo "Test 1: Ricerca file jpg..."
FOUND=$(find . -maxdepth 1 -iname "*.jpg" | wc -l)
if [ "$FOUND" -eq 3 ]; then
    echo "✓ Test 1 passed: Trovati 3 file jpg"
else
    echo "✗ Test 1 failed: Trovati $FOUND file invece di 3"
fi

# Test 2: Esegui script in modalità dry-run
echo "Test 2: Esecuzione script (dry-run)..."
echo -e "test\nN" | timeprogressive-rename jpg
if [ $? -eq 0 ]; then
    echo "✓ Test 2 passed: Script eseguito senza errori"
else
    echo "✗ Test 2 failed: Errore nell'esecuzione"
fi

# Cleanup
cd /
rm -rf "$TEST_DIR"

echo "=== Test completati ==="
```

Rendi eseguibile e lancia:
```bash
chmod +x test_script.sh
./test_script.sh
```

## Debugging

Se qualcosa non funziona, puoi aggiungere output di debug allo script Python.

Apri `timeprogressive-rename` con Kate e aggiungi print di debug:

```python
# Esempio di debug
print(f"DEBUG: File trovati: {files}")
print(f"DEBUG: Timestamp file: {timestamp}")
```

Oppure esegui Python in modalità verbose:

```bash
python3 -v timeprogressive-rename jpg
```

## Ripristino dopo un Test

Se hai fatto un test e vuoi ripristinare i nomi originali:

1. **Se hai un backup**: Ripristina dalla copia
2. **Se ricordi i nomi**: Rinomina manualmente
3. **Se vuoi tornare indietro**: Usa di nuovo lo script con i vecchi nomi come prefisso

## Note Importanti

⚠️ **IMPORTANTE**: Prima di usare lo script su file importanti:
1. Fai **SEMPRE** un backup completo
2. Testa in una cartella di prova
3. Verifica l'anteprima attentamente
4. Se non sei sicuro, rispondi `N` e controlla meglio

💡 **SUGGERIMENTO**: Per file molto importanti (foto di matrimonio, documenti legali, ecc.), considera di:
- Fare più di un backup
- Testare lo script su una copia prima
- Verificare che i backup siano integri prima di procedere
