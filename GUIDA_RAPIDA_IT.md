# Time Progressive Rename - Quick Start Guide

## 🎉 Your project is ready!

You now have a complete and professional Python project to rename files with progressive numbering based on date.

## 📦 What You Received

The project consists of:

1. **timeprogressive-rename** - Main Python script (executable)
2. **README.md** - Complete project documentation (in English)
3. **EXAMPLES.md** - Practical usage examples
4. **TESTING.md** - Guide for testing the script
5. **GIT_GUIDE.md** - Git guide for beginners
6. **LICENSE** - MIT License
7. **.gitignore** - Files to ignore in Git
8. **examples/test_files/** - Folder with test files

## 🚀 Getting Started

### 1. Copy the project to your PC

Download the `timeprogressive-rename` folder and copy it where you prefer, for example:

```bash
# Assuming you downloaded it to ~/Download
mv ~/Download/timeprogressive-rename ~/Projects/

cd ~/Projects/timeprogressive-rename
```

### 2. Make the script executable

```bash
chmod +x timeprogressive-rename
```

### 3. (Optional) Install the script system-wide

If you want to use it from any folder without typing the full path:

```bash
sudo cp timeprogressive-rename /usr/local/bin/
```

Or, if you prefer not to use sudo, you can add it to your personal PATH:

```bash
mkdir -p ~/.local/bin
cp timeprogressive-rename ~/.local/bin/
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### 4. Try the script!

```bash
# Go to the test folder
cd examples/test_files/

# Run the script
../../timeprogressive-rename jpg

# When prompted, enter a prefix, for example: photo_test
# Check the preview
# Reply N to cancel or Y to execute
```

## 📝 Daily Usage

### Example: Rename vacation photos

```bash
# Go to the folder with photos
cd ~/Pictures/vacation_2024/

# Run the script
timeprogressive-rename jpg jpeg

# Enter prefix: vacation_beach
# Check preview
# Confirm with Y
```

### Example: Rename screenshots

```bash
cd ~/Pictures/Screenshots/
timeprogressive-rename png
# Prefix: screen
```

## 🌟 Main Features

- ✨ **Automatic sorting** by creation/modification date
- 🎨 **Colored interface** in terminal
- 👁️ **Preview** before modifying files
- 🔒 **Safe handling** of name conflicts
- 🔤 **Case-insensitive** for extensions
- 📊 **Statistics** at end of operation

## 🐙 Upload to GitHub

### First time using Git?

1. **Install Git** (if you don't have it already):
```bash
sudo pacman -S git
```

2. **Configure Git** (only the first time):
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Upload the project to GitHub

The Git repository is already ready! Follow these steps:

1. **Go to GitHub.com** and create an account (if you don't have one)

2. **Create a new repository**:
   - Click "+" in the top right → "New repository"
   - Name: `timeprogressive-rename`
   - Description: "Python script to rename files with progressive numbering"
   - **DO NOT** select "Initialize with README" (you already have one!)
   - Click "Create repository"

3. **Connect your local repository to GitHub**:
```bash
cd ~/Projects/timeprogressive-rename

# Replace 'yourusername' with your GitHub username
git remote add origin https://github.com/yourusername/timeprogressive-rename.git

# Upload the code
git push -u origin main
```

4. **Authentication**:
   - GitHub will ask for username and password
   - **IMPORTANT**: You can no longer use the regular password!
   - You need to create a **Personal Access Token**:
     - Go to GitHub.com → Settings → Developer settings
     - Personal access tokens → Tokens (classic)
     - Generate new token (classic)
     - Select "repo"
     - Copy the token
     - Use it instead of password when pushing

### Future Updates

When you modify the code:

```bash
# See what you changed
git status

# Add the changes
git add .

# Commit with a descriptive message
git commit -m "Fix: Fixed conflict handling bug"

# Upload to GitHub
git push
```

## 📖 Complete Documentation

Read the documentation files to learn more:

- **README.md** - Complete documentation with all technical details
- **EXAMPLES.md** - 6 practical usage scenarios with complete commands
- **TESTING.md** - How to test the script safely
- **GIT_GUIDE.md** - Everything about Git and GitHub for beginners

## 🔧 Customization

Want to modify the script? Open `timeprogressive-rename` with your editor:

```bash
kate timeprogressive-rename
```

The code is well-commented and divided into clear functions. Some things you might want to modify:

- **Number of digits** in numbering (currently 3: 001, 002, etc.)
  - Find: `f"{index:03d}"` and change `03` to desired number of digits

- **Separator** between prefix and number (currently "_")
  - Find: `f"{prefix}_{number}{extension}"` and change `_` to what you prefer

- **Terminal colors**
  - Modify the `Colors` class at the beginning of the file

## ⚠️ Security Recommendations

1. **Always make a backup** before renaming important files
2. **Check the preview** carefully
3. **Test first** in a test folder
4. **Don't use on system files** (only on your personal documents)

## 🆘 Help and Support

If you have problems:

1. Check **TESTING.md** to verify everything works
2. Reread **EXAMPLES.md** to see if your use case is covered
3. Check the FAQ section in README.md
4. If you uploaded the project to GitHub, you can open an "Issue"

## 🎓 Learning Python

This project is a great starting point for learning Python! The code includes:

- ✅ Command line argument handling (`argparse`)
- ✅ File and folder manipulation (`pathlib`)
- ✅ Sorting and lists
- ✅ Error handling (`try/except`)
- ✅ Well-structured functions
- ✅ Complete documentation
- ✅ Terminal colors

Study the code, modify it, experiment!

## 📜 License

The project uses MIT license - you can do practically anything you want with this code!

## ✨ Next Steps

1. ✅ Test the script with the example files
2. ✅ Use it on a small set of real files (with backup!)
3. ✅ Upload the project to GitHub
4. ✅ Customize according to your needs
5. ✅ Share with others (if you want)!

---

**Have fun with your new tool!** 🚀

If you have questions or problems, don't hesitate to ask.
