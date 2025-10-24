global theFiles
global theFileContents
global thetids

global numCol
global nameCol
global pgsCol
global notesCol
global notesTog
global numRows
global newCueName
global newCueNum
global newCueNotes
global newCue

global QVers

global alphabet

on startQLab(qnum, qname, qnotes, qversion, filepath)
	
	set alphabet to "abcdefghijklmnopqrstuvwxyz"
	
	set theFiles to POSIX file (filepath)
	
	if length of qnum > 1 or length of qname > 1 or length of qnotes > 1 then
		error display dialog ("An error occurred: 1002 " & "
Column letters out of range. " & "
Check that column letters are A-Z (not case-sensitive).") with title "CueBilt (Error)" with icon caution
	else
		set numCol to qnum
		set nameCol to qname
		set notesCol to qnotes
	end if
	
	
	try
		set theFileContents to read theFiles
	on error
		display dialog ("An error occurred: 1001 " & "
No file found. Please load a file.") with title "CueBilt (Error)" with icon caution
	end try
	
	set thetids to AppleScript's text item delimiters
	tell application "Finder" to set fileType to name extension of file theFiles
	set AppleScript's text item delimiters to tab
	set numRows to count of paragraphs of theFileContents
	
	
	if qversion is "QLab 3" then
		controlQLab3()
	else if qversion is "QLab 4" then
		controlQLab4()
	else if qversion is "QLab 5" then
		controlQLab5()
	end if
end startQLab

on startQLabtest(num)
	tell application id "com.figure53.qlab.5" to tell front workspace
		activate
		display dialog "I have received the " & num & "th test message!"
	end tell
end startQLabtest

on controlQLab3()
	tell application id "com.figure53.qlab.3" to tell front workspace
		activate
		repeat with rowCount from 2 to numRows
			try
				set newCueName to text item (offset of nameCol in alphabet) of paragraph rowCount of theFileContents
				set newCueNum to text item (offset of numCol in alphabet) of paragraph rowCount of theFileContents
				set newCueNotes to text item (offset of notesCol in alphabet) of paragraph rowCount of theFileContents
			on error
				display dialog ("An error occurred: 1003 " & "
'Q Number' or 'Q Name' column left blank. " & "
Check that column letters for 'Q Number' and 'Q Name' are A-Z (not case-sensitive). " & "
'Notes' column can be left blank if you choose not to transfer notes.") with title "CueBilt (Error)" with icon caution
			end try
			if newCueNum = "" then
				set rowCount to rowCount + 1
			else
				try
					set newCueNum to newCueNum as string
					try
						make type "group"
						set newCue to last item of (selected as list)
						set mode of newCue to fire_all
						set the q name of newCue to newCueName
						set the q number of newCue to newCueNum
						set notes of newCue to newCueNotes
					end try
				end try
			end if
		end repeat
		display dialog "Transfer Complete!" buttons {"OK"} default button 1 with icon 1
	end tell
end controlQLab3


on controlQLab4()
	tell application id "com.figure53.qlab.4" to tell front workspace
		activate
		repeat with rowCount from 2 to numRows
			try
				set newCueName to text item (offset of nameCol in alphabet) of paragraph rowCount of theFileContents
				set newCueNum to text item (offset of numCol in alphabet) of paragraph rowCount of theFileContents
				set newCueNotes to text item (offset of notesCol in alphabet) of paragraph rowCount of theFileContents
			on error
				display dialog ("An error occurred: 1003 " & "
'Q Number' or 'Q Name' column left blank. " & "
Check that column letters for 'Q Number' and 'Q Name' are A-Z (not case-sensitive). " & "
'Notes' column can be left blank if you choose not to transfer notes.") with title "CueBilt (Error)" with icon caution
			end try
			if newCueNum = "" then
				set rowCount to rowCount + 1
			else
				try
					set newCueNum to newCueNum as string
					try
						make type "group"
						set newCue to last item of (selected as list)
						set mode of newCue to timeline
						set the q name of newCue to newCueName
						set the q number of newCue to newCueNum
						collapse newCue
						set notes of newCue to newCueNotes
					end try
				end try
			end if
		end repeat
		display dialog "Transfer Complete!" buttons {"OK"} default button 1 with icon 1
	end tell
end controlQLab4

on controlQLab5()
	tell application id "com.figure53.qlab.5" to tell front workspace
		activate
		repeat with rowCount from 2 to numRows
			try
				set newCueName to text item (offset of nameCol in alphabet) of paragraph rowCount of theFileContents
				set newCueNum to text item (offset of numCol in alphabet) of paragraph rowCount of theFileContents
				set newCueNotes to text item (offset of notesCol in alphabet) of paragraph rowCount of theFileContents
			on error
				display dialog ("An error occurred: 1003 " & "
'Q Number' or 'Q Name' column left blank. " & "
Check that column letters for 'Q Number' and 'Q Name' are A-Z (not case-sensitive). " & "
'Notes' column can be left blank if you choose not to transfer notes.") with title "CueBilt (Error)" with icon caution
			end try
			if newCueNum = "" then
				set rowCount to rowCount + 1
			else
				try
					set newCueNum to newCueNum as string
					try
						make type "group"
						set newCue to last item of (selected as list)
						set mode of newCue to timeline
						set the q name of newCue to newCueName
						set the q number of newCue to newCueNum
						collapse newCue
						set notes of newCue to newCueNotes
					end try
				end try
			end if
		end repeat
		display dialog "Transfer Complete!" buttons {"OK"} default button 1 with icon 1
	end tell
end controlQLab5

--startQLab("a", "b", "c", "QLab 5", "/Users/tylerberg/Downloads/REC Workshop Fall 2025 Cue List - Cues.tsv")

--startQLabtest("a", "b", "c", "QLab 5", "/Users/tylerberg/Downloads/REC Workshop Fall 2025 Cue List - Cues.tsv")

(*

ERROR LIST
1001: No file found
1002: Column letters out of range (check)
1003: Q Number or Q Name not formatted correctly
1004: 
1005:
1006:
1007:
1008:
1009:
1010:

*)
