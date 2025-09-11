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

            click at {20, 202}
            delay 1

            -- click at {400, 250}
            -- delay 0.3
            keystroke arg_fqdn
            delay 0.3

            -- click at {400, 300}
            -- delay 0.3
	    keystroke tab
            keystroke arg_entname
            delay 0.3

            -- click at {400, 350}
            -- delay 0.3
	    keystroke tab
            keystroke arg_userid
            delay 0.5

	    -- click Submit button
            -- click at {267, 349}
	    click button "Submit"
	    -- keystroke return

	    display notification "Wait for 30 seconds"

	    delay 30

	    -- entering the password
	    keystroke arg_password
	    keystroke return
	    delay 5

	    -- wait for user to enter code in microsoft auth
	    display notification "Wait for 30 seconds"
	    delay 30

	    keystroke return

        end tell
    end tell
end run
