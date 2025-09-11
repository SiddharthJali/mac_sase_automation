-- tell application "Versa SASE Client" to activate
delay 2

tell application "System Events"
	tell process "Versa SASE Client"

		click button "Connection Status" of window 1
		display notification "Clicked"
		delay 2
		
		click text "Details" of window 1
	end tell

end tell
-- end tell
