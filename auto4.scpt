-- waitForElement function
on waitForElement(theElement, timeoutSeconds)
    tell application "System Events"
        set startTime to (current date)
        repeat until ((current date) - startTime > timeoutSeconds)
            try
                if exists theElement then return true
            end try
            delay 0.3
        end repeat
        return false
    end tell
end waitForElement

on run argv
    set arg_fqdn to item 1 of argv
    set arg_entname to item 2 of argv
    set arg_userid to item 3 of argv
    set arg_password to item 4 of argv

    tell application "Versa SASE Client" to activate
    delay 1

    tell application "System Events"
        tell process "Versa SASE Client"

            -- setting the window at {0, 0}
            -- set position of window 1 to {0, 0}
            delay 0.3

			if not (exists button "Connection Status" of window 1) then
				-- click button "Connect"
				click button 2 of window 1

				-- check for "Registration is mandatory!" popup
				set var_registered to false
				if my waitForElement(static text "Registration is mandatory!" of window 1, 5) then
					set var_registered to true
				else if my waitForElement(static text "Failed to connect!" of window 1, 5) then
					set var_registered to true
				end if
				
				if var_registered then
					-- start the Registration
					display notification "Registration is required — proceeding..."

					-- click button "Register"
					click button 3 of window 1

					-- enter FQDN
					keystroke arg_fqdn
					keystroke tab

					-- enter Enterprise Name
					keystroke arg_entname
					keystroke tab

					-- enter User ID
					keystroke arg_userid
					delay 0.3

					-- Submitting 
					keystroke return

					-- enter password
					-- delay 20
					-- keystroke arg_password
					-- keystroke return

					delay 0.5
					-- Wait for the loading page to appear
					if my waitForElement(static text "Please wait.." of window 1, 10) then
						display notification "Registration in progress..."
					else
						display notification "No loading screen detected, don't know what to do next..."
					end if
					
					-- Now wait until loading disappears
					set startTime to (current date)
					repeat while ((current date) - startTime < 30) -- max 30 seconds timeout
						try
							if not (exists static text "Please wait.." of window 1) then
								exit repeat
							end if
						end try
						delay 0.5
					end repeat

					-- Wait until password field becomes visible
					delay 3
					-- if my waitForElement(static text "Enter password" of window 1, 20) then
							display notification "Entering the password..."
							delay 0.6
							keystroke arg_password
							keystroke return
					-- else
							-- display notification "Password field not found, registration failed!"
					-- end if

					-- wait for Microsoft 2FA
					display notification "Complete the Microsoft 2FA on your Mobile device (20 seconds)..."
					delay 20

					-- pressing the "Yes
					keystroke return

				else
					-- just connecting part
					display notification "User is already registered — connecting..."

					if my waitForElement(static text "Please wait.." of window 1, 10) then
						display notification "Connecting..."
					else
						display notification "Some Error occurred!"
					end if

				end if
				
			else
				display notification "Already Connected!"
			end if
			
        end tell
    end tell
end run


