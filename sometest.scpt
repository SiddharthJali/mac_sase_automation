tell application "Versa SASE Client" to activate
delay 0.3

tell application "System Events"
	tell process "Versa SASE Client"

		delay 2
		display dialog "Working!👍"
		
	end tell

end tell
