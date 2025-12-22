global theFiles
global theFileContents
global thetids

global numCol
global nameCol
global pgsCol
global pgsTog
global notesCol
global numRows
global newCueName
global newCueNum
global newCueNotes
global newCue

global alphabet

on startQLab(qnum, qname, qnotes, qpgs, pgsBol, qversion, filepath)
	set alphabet to "abcdefghijklmnopqrstuvwxyz"
	set theFiles to POSIX file (filepath)
	
	if length of qnum > 1 or length of qname > 1 or length of qnotes > 1 or length of qpgs > 1 then
		error display dialog ("An error occurred: 1002 " & "
Column letters out of range. " & "
Check that column letters are A-Z (not case-sensitive).") with title "CueBilt (Error)" with icon caution
	else
		set numCol to qnum
		set nameCol to qname
		set notesCol to qnotes
		set pgsCol to qpgs
		set pgsTog to pgsBol
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

on controlQLab5()
	set newCueNum to ""
	set newCueName to ""
	set newCueNotes to ""
	set newCuePgs to ""
	tell application id "com.figure53.qlab.5" to tell front workspace
		activate
		repeat with rowCount from 2 to numRows
			try
				set newCueNum to text item (offset of numCol in alphabet) of paragraph rowCount of theFileContents
			end try
			try
				set newCueName to text item (offset of nameCol in alphabet) of paragraph rowCount of theFileContents
			end try
			try
				set newCueNotes to text item (offset of notesCol in alphabet) of paragraph rowCount of theFileContents
			end try
			try
				set newCuePgs to text item (offset of pgsCol in alphabet) of paragraph rowCount of theFileContents
			end try

			set newCueNum to newCueNum as string
			try
				make type "group"
				set newCue to last item of (selected as list)
				set mode of newCue to timeline
				try
					set the q name of newCue to newCueName
				end try
				try
					set the q number of newCue to newCueNum
				end try
				try
					set notes of newCue to newCueNotes
				end try
				try
					if newCuePgs is "" then
						--do nothing
					else
						if pgsTog is "True" then
								set q name of newCue to ("(p. " & newCuePgs & ") - " & newCueName)
						else
								set notes of newCue to ("(p. " & newCuePgs & ") - " & newCueNotes)
						end if
					end if		
				end try
			end try
		end repeat
	end tell
end controlQLab5

on controlQLab4()
	set newCueNum to ""
	set newCueName to ""
	set newCueNotes to ""
	tell application id "com.figure53.qlab.4" to tell front workspace
		activate
		repeat with rowCount from 2 to numRows
			try
				set newCueNum to text item (offset of numCol in alphabet) of paragraph rowCount of theFileContents
			end try
			try
				set newCueName to text item (offset of nameCol in alphabet) of paragraph rowCount of theFileContents
			end try
			try
				set newCueNotes to text item (offset of notesCol in alphabet) of paragraph rowCount of theFileContents
			end try
			set newCueNum to newCueNum as string
			try
				make type "group"
				set newCue to last item of (selected as list)
				set mode of newCue to timeline
				try
					set the q name of newCue to newCueName
				end try
				try
					set the q number of newCue to newCueNum
				end try
				try
					set notes of newCue to newCueNotes
				end try
				collapse newCue
			end try
		end repeat
	end tell
end controlQLab4

on controlQLab3()
	set newCueNum to ""
	set newCueName to ""
	set newCueNotes to ""
	tell application id "com.figure53.qlab.3" to tell front workspace
		activate
		repeat with rowCount from 2 to numRows
			try
				set newCueNum to text item (offset of numCol in alphabet) of paragraph rowCount of theFileContents
			end try
			try
				set newCueName to text item (offset of nameCol in alphabet) of paragraph rowCount of theFileContents
			end try
			try
				set newCueNotes to text item (offset of notesCol in alphabet) of paragraph rowCount of theFileContents
			end try
			set newCueNum to newCueNum as string
			try
				make type "group"
				set newCue to last item of (selected as list)
				set mode of newCue to fire_all
				try
					set the q name of newCue to newCueName
				end try
				try
					set the q number of newCue to newCueNum
				end try
				try
					set notes of newCue to newCueNotes
				end try
				--collapse newCue
			end try
		end repeat
	end tell
end controlQLab3





(* TEST FUNCTIONS *)
--startQLab("a", "b", "k", "", True, "QLab 5", "/Users/tylerberg/Downloads/7RAV Sound Cue Sheet - EDIT.tsv")

-- startQLabtest(5)

(*

ERROR LIST
1001: No file found
1002: Column letters out of range (check)
1003: --Q Number or Q Name not formatted correctly
1004: 
1005:
1006:
1007:
1008:
1009:
1010:

*)