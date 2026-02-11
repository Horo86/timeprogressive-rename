# Practical Usage Examples

This guide shows concrete examples of how to use `timeprogressive-rename` in various scenarios.

## Scenario 1: Rename vacation photos

You have a folder with photos taken on different dates during a vacation:

```
photos/
├── IMG_20240701_143022.jpg
├── IMG_20240702_091533.jpg
├── IMG_20240702_183044.jpg
├── DCIM_0001.jpg
└── DCIM_0002.jpg
```

**Command:**
```bash
cd photos
timeprogressive-rename jpg
```

**Required input:**
```
Enter the prefix to use: vacation_beach
```

**Result:**
```
vacation_beach_001.jpg  (oldest photo)
vacation_beach_002.jpg
vacation_beach_003.jpg
vacation_beach_004.jpg
vacation_beach_005.jpg  (newest photo)
```

---

## Scenario 2: Organize screenshots

You have many screenshots with random names:

```
screenshots/
├── Screenshot from 2024-01-15 10-23-45.png
├── Schermata del 2024-01-16 alle 14.30.22.png
├── Screenshot_20240117_093011.png
└── capture.png
```

**Command:**
```bash
cd screenshots
timeprogressive-rename png
```

**Required input:**
```
Enter the prefix to use: screen
```

**Result:**
```
screen_001.png
screen_002.png
screen_003.png
screen_004.png
```

---

## Scenario 3: Rename event videos

You have videos recorded with different devices during an event:

```
event/
├── VID_20240320_100530.mp4
├── video(1).mp4
├── MVI_2034.MOV
├── recording_001.MP4
└── clip.avi
```

**Command:**
```bash
cd event
timeprogressive-rename mp4 mov avi
```

**Required input:**
```
Enter the prefix to use: conference_2024
```

**Result:**
```
conference_2024_001.mp4
conference_2024_002.mp4
conference_2024_003.MOV   (keeps original extension)
conference_2024_004.MP4
conference_2024_005.avi
```

---

## Scenario 4: Organize scanned documents

You have scans of documents in various formats:

```
scans/
├── scan0001.pdf
├── document.PDF
├── scan (1).pdf
├── doc_001.jpg
└── img_2024.jpeg
```

**Command:**
```bash
cd scans
timeprogressive-rename pdf jpg jpeg
```

**Required input:**
```
Enter the prefix to use: purchase_agreement
```

**Result:**
```
purchase_agreement_001.pdf
purchase_agreement_002.PDF
purchase_agreement_003.pdf
purchase_agreement_004.jpg
purchase_agreement_005.jpeg
```

---

## Scenario 5: Rename audio files

You have audio recordings of lectures or podcasts:

```
audio/
├── Recording (1).m4a
├── Recording (2).m4a
├── voice_memo_20240115.mp3
└── audio_20240116.wav
```

**Command:**
```bash
cd audio
timeprogressive-rename mp3 m4a wav
```

**Required input:**
```
Enter the prefix to use: python_lesson
```

**Result:**
```
python_lesson_001.m4a
python_lesson_002.m4a
python_lesson_003.mp3
python_lesson_004.wav
```

---

## Scenario 6: Complete workflow with preview

Complete example of an interactive session:

```bash
$ cd ~/Downloads/birthday_photos
$ timeprogressive-rename jpg jpeg

================================================================================
TIME PROGRESSIVE RENAME
================================================================================

Directory: /home/user/Downloads/birthday_photos
Extensions: jpg, jpeg

Searching for files...
✓ Found 12 files

Enter the prefix to use: birthday_2024

================================================================================
RENAME OPERATIONS PREVIEW
================================================================================

No    Creation/Modification Date Original Name             →   New Name              
--------------------------------------------------------------------------------
1     2024-03-15 18:30:45    IMG_0001.jpg              →   birthday_2024_001.jpg  
2     2024-03-15 18:31:12    IMG_0002.jpg              →   birthday_2024_002.jpg  
3     2024-03-15 18:35:03    DSC_1234.jpeg             →   birthday_2024_003.jpeg 
4     2024-03-15 18:42:56    cake_photo.jpg            →   birthday_2024_004.jpg  
5     2024-03-15 19:15:23    group.JPG                 →   birthday_2024_005.JPG  
...

--------------------------------------------------------------------------------
Total files to rename: 12
================================================================================

Proceed with rename? (Y/N): Y

Executing rename...

✓ Renamed: IMG_0001.jpg → birthday_2024_001.jpg
✓ Renamed: IMG_0002.jpg → birthday_2024_002.jpg
✓ Renamed: DSC_1234.jpeg → birthday_2024_003.jpeg
...

================================================================================
FINAL STATISTICS
================================================================================

✓ Files successfully renamed: 12
✓ No errors

================================================================================
```

---

## Tips and Best Practices

### Recommended prefixes

- **Dates**: `2024_january`, `2024-01-15`
- **Events**: `john_wedding`, `ai_conference`
- **Projects**: `thesis_project`, `website`
- **Categories**: `invoices_2024`, `receipts_january`

### Before you start

1. **Always make a backup** before renaming many important files
2. **Check the preview** carefully before confirming
3. **Use descriptive prefixes** that make it easy to identify files
4. **Test first** with a few files in a test folder

### After renaming

If you've renamed files by mistake, you can:
1. Undo the operation with `Ctrl+Z` if you made a backup
2. Use the script again with a different prefix
3. Rename manually if there are only a few files

---

## Integration with other tools

### Use with find to select specific files

First move the files you want to rename to a temporary folder:

```bash
# Find and move only photos larger than 1MB
find . -name "*.jpg" -size +1M -exec mv {} temp_folder/ \;

# Now rename
cd temp_folder
timeprogressive-rename jpg
```

### Create a wrapper script

You can create a custom bash script that combines operations:

```bash
#!/bin/bash
# rename_and_move.sh

# Rename
timeprogressive-rename jpg jpeg png

# Move to archive folder
mkdir -p ../archive_$(date +%Y%m%d)
mv *.jpg *.jpeg *.png ../archive_$(date +%Y%m%d)/
```

---

## Troubleshooting

### Problem: "No files found"
**Solution**: Make sure you're in the correct folder and that extensions are spelled correctly (without dot).

### Problem: The script doesn't start
**Solution**: Make sure the script is executable:
```bash
chmod +x timeprogressive-rename
```

### Problem: Permission errors
**Solution**: Verify that you have write permissions in the folder:
```bash
ls -la
# If necessary, change permissions
chmod u+w *
```
