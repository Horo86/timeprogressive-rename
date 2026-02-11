# Time Progressive Rename

A Python script to rename files in an organized way by adding a custom prefix and a progressive number based on file creation or modification date.

## Description

`timeprogressive-rename` is a command-line tool that allows you to rename batch files with specific extensions, sorting them by their creation date (or modification date if creation date is not available) and adding progressive numbering.

## Features

- ✨ Rename multiple files with a single command
- 📅 Automatic sorting by creation/modification date
- 🎨 Colored and user-friendly terminal interface
- 👁️ Preview of changes before execution (dry run)
- 🔒 Intelligent name conflict handling
- 🔤 Case-insensitive extension search
- 📊 Detailed statistics at end of operation

## Requirements

- Python 3.6 or higher
- Linux operating system

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/timeprogressive-rename.git
cd timeprogressive-rename
```

2. Make the script executable:
```bash
chmod +x timeprogressive-rename
```

3. (Optional) Move the script to a directory in your PATH to use it anywhere:
```bash
sudo cp timeprogressive-rename /usr/local/bin/
```

## Usage

### Basic Syntax

```bash
./timeprogressive-rename <extension1> [extension2] [extension3] ...
```

### Examples

Rename all JPEG files:
```bash
./timeprogressive-rename jpg jpeg
```

Rename multiple image files:
```bash
./timeprogressive-rename jpg png gif webp
```

Rename video files:
```bash
./timeprogressive-rename mp4 avi mkv
```

### How It Works

1. **Start**: Run the script in the folder containing the files to rename, specifying the extensions
2. **Prefix**: The script will ask you to enter a prefix (e.g. "vacation", "photos", "document")
3. **Preview**: You will see a table with:
   - Progressive number
   - Creation/modification date
   - Original filename
   - Proposed new name
4. **Confirm**: Reply Y to proceed, N to cancel
5. **Result**: The script executes the renames and shows statistics

### Resulting Name Format

Files will be renamed following this schema:
```
<prefix>_<number>.<extension>
```

Where:
- `<prefix>` is the text entered by the user
- `<number>` is a progressive number with 3 digits (001, 002, 003, ...)
- `.<extension>` is the original file extension

**Example**:
```
Input: IMG_20240101.jpg, IMG_20240102.jpg, IMG_20240103.jpg
Prefix: vacation
Output: vacation_001.jpg, vacation_002.jpg, vacation_003.jpg
```

## Technical Details

### Date Handling

- The script uses file creation date when available
- On ext4 and similar filesystems (where creation date might not be available), it uses modification date
- Files are sorted in chronological order (ascending)

### Conflict Handling

The script automatically handles name conflicts:
1. Identifies files that would have the same target name
2. Renames them temporarily
3. Executes all main renames
4. Renames temporary files to their final names

### Case Sensitivity

Extensions are treated in a case-insensitive manner:
- `.jpg`, `.JPG`, `.Jpg` are all considered equal

## Documentation

- **[EXAMPLES.md](EXAMPLES.md)** - Practical usage examples in various scenarios
- **[TESTING.md](TESTING.md)** - Complete guide to testing the script
- **[GIT_GUIDE.md](GIT_GUIDE.md)** - Beginner's guide to Git and GitHub

## Project Structure

```
timeprogressive-rename/
├── README.md              # This file
├── EXAMPLES.md            # Practical usage examples
├── TESTING.md             # Testing guide
├── GIT_GUIDE.md          # Git guide for beginners
├── LICENSE                # Project license
├── .gitignore            # Files to ignore in Git
├── timeprogressive-rename # Main script
└── examples/
    └── test_files/       # Example files for testing
```

## Contributing

Contributions are welcome! To contribute:

1. Fork the project
2. Create a branch for your feature (`git checkout -b feature/new-functionality`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push the branch (`git push origin feature/new-functionality`)
5. Open a Pull Request

## License

This project is released under the MIT license. See the `LICENSE` file for details.

## Author

Your Name

## Changelog

### Version 1.0.0 (2026-02-01)
- Initial release
- Rename based on creation/modification date
- Multi-extension support
- Interactive preview
- Name conflict handling

## FAQ

**Q: Does the script work recursively in subfolders?**  
A: No, the script operates only in the current directory.

**Q: Can I undo changes after confirming?**  
A: No, which is why it's important to carefully review the preview before confirming.

**Q: What happens if there are files with the same date?**  
A: Files with the same date maintain a deterministic order based on their order in the filesystem.

**Q: Can I use spaces in the prefix?**  
A: Yes, the prefix can contain spaces and special characters.

## Support

For bugs, questions or suggestions, open an issue on GitHub.
