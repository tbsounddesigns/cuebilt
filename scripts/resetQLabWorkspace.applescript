on reset(qversion)
	if qversion = "QLab 3" then
		tell application id "com.figure53.QLab.3"
			activate
			tell front workspace
				set warningMsg to display dialog "WARNING: This will clear ALL cues from the currently displayed cue list in QLab. Proceed?" buttons {"Cancel", "OK"} default button 1 with icon caution
				if button returned of warningMsg is "Cancel" then
					-- do nothing
				else if button returned of warningMsg is "OK" then
					delete cues of first cue list
				end if
			end tell
		end tell
	else if qversion = "QLab 4" then
		tell application id "com.figure53.QLab.4"
			activate
			tell front workspace
				set warningMsg to display dialog "WARNING: This will clear ALL cues from the currently displayed cue list in QLab. Proceed?" buttons {"Cancel", "OK"} default button 1 with icon caution
				if button returned of warningMsg is "Cancel" then
					-- do nothing
				else if button returned of warningMsg is "OK" then
					delete cues of first cue list
				end if
			end tell
		end tell
	else if qversion = "QLab 5" then
		tell application id "com.figure53.QLab.5"
			activate
			tell front workspace
				set warningMsg to display dialog "WARNING: This will clear ALL cues from the currently displayed cue list in QLab. Proceed?" buttons {"Cancel", "OK"} default button 1 with icon caution
				if button returned of warningMsg is "Cancel" then
					-- do nothing
				else if button returned of warningMsg is "OK" then
					delete cues of first cue list
				end if
			end tell
		end tell
	end if
end reset

--reset()