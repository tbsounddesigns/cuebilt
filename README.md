<img width="64" height="64" alt="cuebilt" src="https://github.com/user-attachments/assets/b08d2126-f727-4706-b3e0-bf62df4cb70c"/>

# CueBilt

CueBilt is a program that can take TSV-formatted cue sheet and build a skeleton cue list in QLab. Designers can build their cue sheets, download them as a TSV file, import them, and watch QLab magically make a group cue for each cue in their sheet. This takes the hassle and time out of the first steps to building a QLab workspace. **[Watch the demo here.](https://youtu.be/CbJnxZp8ooE)**

**[Check out my website/portfolio!](https://tbsounddesigns.com)**

### [<img width="218" height="60" alt="violet-button" src="https://github.com/user-attachments/assets/25e4b252-c797-443f-ab2b-cbd8a480f3a8" target="_blank"/>](https://buymeacoffee.com/tbsounddesigns)

**This project is made with love from NYC to all designers who use QLab.** You are free to use the software or the source code as you see fit. If you appreciate this work and want to support it, **[please consider buying Tyler a mocha.](https://buymeacoffee.com/tbsounddesigns)** ❤️

## Contents
[How to export your spreadsheet as a TSV](#how-to-export-your-spreadsheet-as-a-tsv)<br>
[How to Install CueBilt](#how-to-install-cuebilt)<br>
[How to Update CueBilt](#how-to-update-cuebilt)<br>
[How to Use CueBilt](#how-to-use-cuebilt)<br>
[Privacy & Security Fix on Install](#privacy--security-fix)<br>
[Other Notes](#other-notes)<br>
[Disclaimer](#disclaimer)

## How to export your spreadsheet as a TSV
### Google Sheets
File > Download > Tab separated values (.tsv)

### Numbers (Apple Office)
File > Export to > TSV...

### Microsoft Excel
1. File > Save As... > .txt
2. Change the extension .txt to .tsv in your file browser.
3. NOTE: CueBilt 1.2.0 now supports .txt files in tab-separated format, so step 2 can be skipped, if desired.

## How to Install CueBilt
1. Download the dmg file under the [Releases](https://github.com/tbsounddesigns/cuebilt/releases) section.
2. Open the dmg and copy CueBilt into your Applications folder.
3. Open CueBilt. **You'll likely be met with a warning message saying that Apple can't scan the application for viruses.**
4. Go to **System Settings** > **Privacy & Security**, and click "**Open Anyway**" next to the app name. Enter your password, if prompted.
5. Try opening CueBilt again.

## How to Update CueBilt
1. Download the latest dmg file under the [Releases](https://github.com/tbsounddesigns/cuebilt/releases) section.
2. Your Mac will ask you if you want to replace the existing version of CueBilt in your Applications folder. Click "**Replace**."
3. Follow the instructions on [how to install Cuebilt](#how-to-install-cuebilt) above.

## How to Use CueBilt
1. After opening CueBilt, select which version of QLab you're using, then click "Open QLab" or "New Workspace". (You may need to allow CueBilt to access certain permissions and functions on your computer so that it can control QLab and find your TSV files properly.)
2. Browse your filesystem and find your TSV file.
3. Use either the arrows or type in the letter of the columns you wish to transfer data from the TSV to QLab.
4. Click "Run."
5. Watch QLab populate with all your blank group cues!

## Privacy & Security Fix!!
_**CueBilt may not open immediately, as your Mac may not be able to scan for viruses as a security precaution. To fix this, go to System Settings > Privacy & Security, and scroll down until you see the app name and "Open Anyway." Click this button, enter your password, and it will open.**_

## Other Notes
1. When CueBilt reads your TSV file, it automatically assumes that Row 1 (index 0) is a HEADER row, and will start with Row 2 (index 1). If you believe this should not be the case, submit an ISSUE or PULL REQUEST.
2. You may need to allow CueBilt to access certain permissions and functions on your computer so that it can control QLab and find your TSV files properly.

## Disclaimer
CueBilt or the maker of CueBilt, Tyler A. Berg, is not affiliated with Figure53 or QLab, but he freaking loves their stuff.


