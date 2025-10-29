### v1.2.1 Release Notes
#### CHANGED
- Window now centers on startup

#### FIXED
- Program will still run, even if some column entries are left blank. 

------

### v1.2.0 Release Notes
#### ADDED
- A couple error codes and error messages if something doesn't work right. Still working on covering the bases on this, and I know there are still a few discrepancies about functionality that may merit an error code in the future.

#### CHANGED
- Changed file structure via .gitignore (thanks to johnmckenna-snd!). All the yucky and unnecessary stuff is gone.

#### FIXED
- Q Number column now supports strings (i.e. combo of letters and numbers) and not just numbers.
- Script files (.applescript/.scpt) are now previewable here on GitHub

------

### v1.1.0 Release Notes
#### ADDED
- Support for .txt files that follow the TSV formatting. This eliminates a step when exporting a spreadsheet to a .txt file from Excel, as it does not directly export to a .tsv file.
- README file is now part of .dmg package when you download the bundled release.