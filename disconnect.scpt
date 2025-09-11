tell application "Versa SASE Client" to activate
delay 1

tell application "System Events"
	tell process "Versa SASE Client"
		
		try
			set position of window 1 to {0, 0}
			delay 0.4
			if exists static text "Connection Status" of window 1 then
				display notification "User is Connected - Disconnecting.."
				click button 2 of window 1
				click button "Disconnect" of window 1
				delay 5
				if not (exists static text "Connection Status" of window 1) then
					display notification "Disconnected"
				else
					display notification "Didn't disconnect"
				end if
			else
				display notification "Not Connected!"
			end if
		on error
			display notification "Some Error!"
		end try

	end tell
end tell
