on openQLab(v)
	if v = "QLab 3" then
		tell application id "com.figure53.qlab.3" to activate
	else if v = "QLab 4" then
		tell application id "com.figure53.qlab.4" to activate
	else if v = "QLab 5" then
		tell application id "com.figure53.qlab.5" to activate
	end if
end openQLab

(*
on openQLab4()
	tell application id "com.figure53.qlab.4" to activate
end openQLab4

on openQLab5()
	tell application id "com.figure53.qlab.5" to activate
end openQLab5
*)


on newQLabWorkspace(v)
	if v = "QLab 3" then
		tell application id "com.figure53.qlab.3" to activate
		-- do nothing
		(*
tell application id "com.figure53.qlab.3"
			make type "Workspace"
		end tell
*)
		
	else if v = "QLab 4" then
		tell application id "com.figure53.qlab.4" to activate
		tell application "System Events"
			tell (first application process whose bundle identifier is "com.figure53.qlab.4")
				click menu item "New Workspace" of menu "File" of menu bar item "File" of menu bar 1
			end tell
		end tell
		(*
		tell application id "com.figure53.qlab.4"
			make type "Workspace"
		end tell
*)
	else if v = "QLab 5" then
		tell application id "com.figure53.qlab.5" to activate
		tell application "System Events"
			tell (first application process whose bundle identifier is "com.figure53.qlab.5")
				click menu item "New Workspace" of menu "File" of menu bar item "File" of menu bar 1
			end tell
		end tell
		(*
		tell application id "com.figure53.qlab.5"
			make type "Workspace"
		end tell
*)
	end if
end newQLabWorkspace

(*
on newQLab4()
	tell application id "com.figure53.qlab.4"
		make workspace
	end tell
end newQLab4

on newQLab5()
	tell application id "com.figure53.qlab.5"
		make workspace
	end tell
end newQLab5
*)
