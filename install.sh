#!/bin/bash
# install.sh - Script di installazione per Time Progressive Rename

set -e

echo "=================================="
echo "Time Progressive Rename - Installer"
echo "=================================="
echo ""

# Colori
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Funzione per stampare messaggi colorati
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Verifica che Python sia installato
echo "Verifica requisiti..."
if ! command -v python3 &> /dev/null; then
    print_error "Python 3 non è installato!"
    echo "Installa Python con: sudo pacman -S python"
    exit 1
fi

PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
print_success "Python $PYTHON_VERSION trovato"

# Chiedi dove installare
echo ""
echo "Scegli il metodo di installazione:"
echo "1) Installazione globale (richiede sudo, disponibile per tutti gli utenti)"
echo "2) Installazione utente (solo per te, no sudo necessario)"
echo "3) Non installare, usa solo dalla cartella corrente"
echo ""
read -p "Scelta [1/2/3]: " choice

case $choice in
    1)
        # Installazione globale
        echo ""
        print_warning "Richiesto sudo per installazione globale"
        sudo cp timeprogressive-rename /usr/local/bin/
        print_success "Script installato in /usr/local/bin/"
        print_success "Puoi usarlo da qualsiasi cartella con: timeprogressive-rename"
        ;;
    2)
        # Installazione utente
        mkdir -p ~/.local/bin
        cp timeprogressive-rename ~/.local/bin/
        print_success "Script installato in ~/.local/bin/"
        
        # Verifica se ~/.local/bin è nel PATH
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            print_warning "~/.local/bin non è nel PATH"
            echo ""
            echo "Aggiungi questa riga al tuo ~/.bashrc o ~/.zshrc:"
            echo 'export PATH="$HOME/.local/bin:$PATH"'
            echo ""
            echo "Vuoi che lo aggiunga automaticamente a ~/.bashrc? [y/N]"
            read -p "> " add_path
            if [[ $add_path =~ ^[Yy]$ ]]; then
                echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
                print_success "PATH aggiornato in ~/.bashrc"
                print_warning "Riavvia il terminale o esegui: source ~/.bashrc"
            fi
        else
            print_success "Puoi usarlo da qualsiasi cartella con: timeprogressive-rename"
        fi
        ;;
    3)
        # Nessuna installazione
        print_success "Ok, usa ./timeprogressive-rename dalla cartella corrente"
        ;;
    *)
        print_error "Scelta non valida"
        exit 1
        ;;
esac

# Rendi eseguibile in ogni caso
chmod +x timeprogressive-rename
print_success "Script reso eseguibile"

echo ""
echo "=================================="
print_success "Installazione completata!"
echo "=================================="
echo ""
echo "Prossimi passi:"
echo "  1. Leggi la documentazione in README.md"
echo "  2. Guarda gli esempi in EXAMPLES.md"
echo "  3. Testa lo script: cd examples/test_files/ && ../../timeprogressive-rename jpg"
echo ""
echo "Divertiti! 🚀"
