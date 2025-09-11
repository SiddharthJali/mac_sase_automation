on run argv
    set arg_fqdn to item 1 of argv
    set arg_entname to item 2 of argv
    set arg_userid to item 3 of argv
    set arg_password to item 4 of argv

    tell application "Versa SASE Client" to activate
    delay 1

    tell application "System Events"
        tell process "Versa SASE Client"

            set position of window 1 to {0, 0}
            delay 1

            -- click the Connect button
            -- click at {139, 386}
	    click button 2 of window 1
            delay 2

            -- check "Registration is mandatory!" text exists
            set var_registered to false
            try
                if exists static text "Registration is mandatory!" of window 1 then
                    set var_registered to true
		end if
		if exists static text "Failed to connect!" of window 1 then
		    set var_registered to true
                end if
            end try

            if var_registered then
                -- doing registration process
                display notification "Registration required — proceeding..."
                delay 1

                -- click on Register button
                -- click at {20, 202}
		click button 3 of window 1
                delay 1

                keystroke arg_fqdn
                delay 0.3
                keystroke tab

                keystroke arg_entname
                delay 0.3
                keystroke tab

                keystroke arg_userid
                delay 0.5

                -- click button "Submit"
                -- click at {267, 349}
		keystroke return

                display notification "Wait for 20 seconds..."
                delay 20

                keystroke arg_password
                keystroke return

                display notification "Waiting for Microsoft Auth approval (20 seconds)..."
                delay 20

                keystroke return
            else
                display notification "User is already registered — Connecting..."

		if exists static text "Please wait.." of window 1 then
			display notification "Connecting..."
			
		else
			display notification "Some Error!"
		end if

            end if

        end tell
    end tell
end run

