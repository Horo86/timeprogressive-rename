# Git Guide for Time Progressive Rename

## Prerequisites

1. Git must be installed on your system:
```bash
sudo pacman -S git
```

2. Configure Git with your name and email (do this only once):
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

## Step 1: Initialize the local repository

In the project folder, run:

```bash
cd /path/to/timeprogressive-rename
git init
```

This creates a local Git repository in the folder.

## Step 2: Add files to the repository

```bash
# Add all files to staging
git add .

# Verify which files were added
git status

# Create the first commit
git commit -m "Initial commit: Time Progressive Rename v1.0.0"
```

## Step 3: Create a repository on GitHub

1. Go to https://github.com
2. Click the "+" button in the top right
3. Select "New repository"
4. Fill in the fields:
   - **Repository name**: `timeprogressive-rename`
   - **Description**: "Python script to rename files with progressive numbering based on date"
   - **Public/Private**: Choose whether you want it public or private
   - ⚠️ **DO NOT** select "Initialize this repository with a README" (you already have one)
   - ⚠️ **DO NOT** add .gitignore or license (you already have them)
5. Click "Create repository"

## Step 4: Connect the local repository to GitHub

GitHub will show you instructions. Use these to connect your local repo:

```bash
# Add the remote repository (replace 'yourusername' with your GitHub username)
git remote add origin https://github.com/yourusername/timeprogressive-rename.git

# Verify that the remote was added correctly
git remote -v

# Rename the main branch to 'main' (if necessary)
git branch -M main

# Upload the code to GitHub
git push -u origin main
```

The first time you push, GitHub will ask you to authenticate.

## Step 5: GitHub Authentication

GitHub no longer supports passwords from the command line. You have two options:

### Option A: Personal Access Token (Recommended)

1. Go to GitHub.com → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Click "Generate new token (classic)"
3. Give the token a name (e.g. "timeprogressive-rename-dev")
4. Select the scope: `repo` (full access to repositories)
5. Click "Generate token"
6. **IMPORTANT**: Copy the token immediately (you won't see it again!)
7. When you do `git push`, use the token as password

### Option B: SSH Key

1. Generate an SSH key:
```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

2. Add the key to SSH agent:
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

3. Copy the public key:
```bash
cat ~/.ssh/id_ed25519.pub
```

4. Go to GitHub.com → Settings → SSH and GPG keys → New SSH key
5. Paste the key and save it
6. Change the repository URL to SSH:
```bash
git remote set-url origin git@github.com:yourusername/timeprogressive-rename.git
```

## Useful Git Commands for the Future

### Make changes and update them on GitHub

```bash
# After modifying files
git status                    # See which files changed
git add .                     # Add all modified files
git commit -m "Description of changes"
git push                      # Upload to GitHub
```

### View commit history

```bash
git log                       # Complete history
git log --oneline            # Compact history
```

### Create a branch for new features

```bash
git checkout -b feature-name  # Create and switch to new branch
# ... make changes ...
git add .
git commit -m "Add new feature"
git push -u origin feature-name

# When you're done, go back to main and merge
git checkout main
git merge feature-name
git push
```

### View differences

```bash
git diff                      # Changes not yet staged
git diff --staged            # Changes in staging
```

### Undo changes

```bash
git checkout -- file.txt     # Undo changes to a file
git reset HEAD file.txt      # Remove file from staging
git reset --soft HEAD~1      # Undo last commit (keeps changes)
git reset --hard HEAD~1      # Undo last commit (DELETE changes!)
```

## Typical Workflow

1. Modify files in your editor
2. `git status` - See what you changed
3. `git add .` - Add the changes
4. `git commit -m "Clear description of change"`
5. `git push` - Upload to GitHub

## Tips for Commit Messages

✅ **Good examples:**
- "Fix: Fixed conflict handling bug"
- "Feature: Added case-sensitive extension support"
- "Docs: Updated README with new examples"
- "Refactor: Improved readability of rename_files function"

❌ **Bad examples:**
- "fix"
- "changes"
- "update"
- "aaaa"

## Useful Resources

- Git cheat sheet: https://education.github.com/git-cheat-sheet-education.pdf
- Pro Git book (free): https://git-scm.com/book/en/v2
- GitHub Docs: https://docs.github.com

## Your Project Structure on GitHub

Once uploaded, your repository will have this structure:

```
https://github.com/yourusername/timeprogressive-rename/
├── README.md (automatically displayed on home page)
├── LICENSE
├── .gitignore
├── timeprogressive-rename
└── examples/
    └── test_files/
```

The README.md will be automatically rendered on the repo's main page!
