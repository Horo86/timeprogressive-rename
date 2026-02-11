# Testing Guide

This guide helps you test `timeprogressive-rename` before using it on your real files.

## Quick Test

We've already prepared test files in the `examples/test_files/` folder:

```bash
cd examples/test_files/
../../timeprogressive-rename jpg
```

When prompted, enter a prefix like `photo_test` and check the preview.
Reply `N` to cancel or `Y` to execute the rename.

## Create Your Own Test Environment

### Option 1: Test folder with dummy files

```bash
# Create a test folder
mkdir ~/test_rename
cd ~/test_rename

# Create some test files with different timestamps
touch -t 202401011200 file1.jpg
sleep 1
touch -t 202401021200 file2.jpg
sleep 1
touch -t 202401031200 file3.JPG
sleep 1
touch -t 202401041200 document.txt

# Test the script
timeprogressive-rename jpg txt
```

### Option 2: Copy real files

```bash
# Create a test folder
mkdir ~/test_rename
cd ~/test_rename

# Copy some real files (COPY, don't move!)
cp ~/Pictures/photo*.jpg .

# Test the script
timeprogressive-rename jpg
```

## Specific Tests

### Test 1: Case Insensitivity

Verify that the script finds files with uppercase/lowercase extensions:

```bash
mkdir test_case
cd test_case
touch file1.jpg file2.JPG file3.Jpg
timeprogressive-rename jpg
# Should find all 3 files
```

### Test 2: Multi-extension

Verify it works with multiple extensions:

```bash
mkdir test_multi
cd test_multi
touch img1.jpg img2.png doc1.pdf
timeprogressive-rename jpg png pdf
# Should find all files
```

### Test 3: Date sorting

Verify correct sorting:

```bash
mkdir test_order
cd test_order

# Create files with specific dates (format: YYYYMMDDhhmm)
touch -t 202403011200 newer.jpg
touch -t 202301011200 older.jpg
touch -t 202302011200 middle.jpg

timeprogressive-rename jpg
# Order should be: older (001), middle (002), newer (003)
```

### Test 4: Conflict handling

Verify name conflict handling:

```bash
mkdir test_conflict
cd test_conflict

# Create files that might have conflicts
touch file1.jpg file2.jpg
# Create a file with the target name
touch test_001.jpg

# Test with prefix "test"
timeprogressive-rename jpg
# All files should be renamed correctly
```

### Test 5: No files found

Verify behavior when there are no files:

```bash
mkdir test_empty
cd test_empty
timeprogressive-rename jpg
# Should show message that no files found
```

### Test 6: Only subfolders

Verify that it does NOT rename files in subfolders:

```bash
mkdir test_subdir
cd test_subdir
touch file1.jpg
mkdir subdir
touch subdir/file2.jpg

timeprogressive-rename jpg
# Should find only file1.jpg, not file2.jpg
```

## Complete Test Checklist

Before using the script on important files, verify:

- [ ] Script correctly finds files with specified extensions
- [ ] Date sorting works correctly
- [ ] Preview shows correct names
- [ ] Y/N confirmation works
- [ ] Files are actually renamed when confirmed
- [ ] Final statistics are correct
- [ ] No errors in terminal
- [ ] Files in subfolders are NOT touched
- [ ] Uppercase/lowercase extensions are handled correctly

## Automated Testing (Bash Script)

You can create a script to test automatically:

```bash
#!/bin/bash
# test_script.sh

echo "=== Time Progressive Rename Test ==="

# Setup
TEST_DIR="/tmp/test_rename_$$"
mkdir -p "$TEST_DIR"
cd "$TEST_DIR"

# Create test files
echo "Creating test files..."
touch -t 202301011200 old.jpg
touch -t 202302011200 middle.jpg
touch -t 202303011200 new.jpg
touch other.txt

# Test 1: Find only jpg files
echo "Test 1: Searching for jpg files..."
FOUND=$(find . -maxdepth 1 -iname "*.jpg" | wc -l)
if [ "$FOUND" -eq 3 ]; then
    echo "✓ Test 1 passed: Found 3 jpg files"
else
    echo "✗ Test 1 failed: Found $FOUND files instead of 3"
fi

# Test 2: Execute script in dry-run mode
echo "Test 2: Running script (dry-run)..."
echo -e "test\nN" | timeprogressive-rename jpg
if [ $? -eq 0 ]; then
    echo "✓ Test 2 passed: Script executed without errors"
else
    echo "✗ Test 2 failed: Error in execution"
fi

# Cleanup
cd /
rm -rf "$TEST_DIR"

echo "=== Tests completed ==="
```

Make executable and run:
```bash
chmod +x test_script.sh
./test_script.sh
```

## Debugging

If something doesn't work, you can add debug output to the Python script.

Open `timeprogressive-rename` with your editor and add debug prints:

```python
# Example debug
print(f"DEBUG: Files found: {files}")
print(f"DEBUG: File timestamp: {timestamp}")
```

Or run Python in verbose mode:

```bash
python3 -v timeprogressive-rename jpg
```

## Recovery After a Test

If you ran a test and want to restore original names:

1. **If you have a backup**: Restore from the copy
2. **If you remember the names**: Rename manually
3. **If you want to go back**: Use the script again with old names as prefix

## Important Notes

⚠️ **IMPORTANT**: Before using the script on important files:
1. **ALWAYS** make a complete backup
2. Test in a test folder
3. Verify the preview carefully
4. If unsure, reply `N` and check more carefully

💡 **SUGGESTION**: For very important files (wedding photos, legal documents, etc.), consider:
- Making more than one backup
- Testing the script on a copy first
- Verifying that backups are intact before proceeding
