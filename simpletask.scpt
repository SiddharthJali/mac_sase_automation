tell application "Versa SASE Client" to activate
delay 1

tell application "System Events"
	tell process "Versa SASE Client"
		
		try
			set position of window 1 to {0, 0}
			delay 1
			-- click at {139, 386}
			-- click button "Cancel" of window 1
			click button 2 of window 1
			display notification  "Button Clicked!"
		on error errMsg number errNum
			display notification "An error occurred: " & errMsg & " (Error Number: " & errNum & ")"
		-- on error
			display notification "Some ERROR!"
		end try

                if exists static text "Registration is mandatory!" of window 1 then
			display notification "User not registered"
		else
			display notification "User is registered"
		end if


	end tell
end tell
