set logData to ""

tell application "Versa SASE Client" to activate
delay 0.5

tell application "System Events"
    tell process "Versa SASE Client"
	
		delay 0.5
        
        try
			set var_entname to value of static text 1 of window 1
			set logData to logData & var_entname & linefeed
        on error
            set logData to logData & "Could not fetch Enterprise Name" & linefeed
        end try

        try
			set var_group to value of static text 2 of window 1
			set logData to logData & var_group & linefeed
        on error
            set logData to logData & "Could not fetch Group" & linefeed
        end try
		
		try
			set var_time to value of static text 3 of window 1
			set logData to logData & var_time & linefeed
        on error
            set logData to logData & "Could not fetch Gateway" & linefeed
        end try
		
		set logData to logData & "---------------------" & linefeed
		
		-- if exists static text "Connection Status" of window 1 then
			-- click button "Connection Status" of window 1
			-- delay 0.4
			-- if exists static text "Details" of window 1 then
				-- click button "Details" of window 1
				-- set var_detailsButton to value of button 7 of window 1
				-- set logData to logData & var_detailsButton & linefeed
				-- click button 1 of window 1
				
				
				delay 0.4
				try
					set var_typeVal to value of static text 2 of scroll area 1 of window 1
					set var_authVal to value of static text 4 of scroll area 1 of window 1
					set var_encrVal to value of static text 6 of scroll area 1 of window 1
					set var_tunnVal to value of static text 8 of scroll area 1 of window 1
					set var_netwVal to value of static text 10 of scroll area 1 of window 1
					set var_loIPVal to value of static text 12 of scroll area 1 of window 1
					set var_puIPVal to value of static text 14 of scroll area 1 of window 1
					set var_destVal to value of static text 16 of scroll area 1 of window 1
					set var_ispVal to value of static text 18 of scroll area 1 of window 1
					
					set logData to logData & "Type: " & var_typeVal & linefeed
					set logData to logData & "Authentication: " & var_authVal & linefeed
					set logData to logData & "Encryption: " & var_encrVal & linefeed
					set logData to logData & "Tunnel Adapter: " & var_tunnVal & linefeed
					set logData to logData & "Network Adapter: " & var_netwVal & linefeed
					set logData to logData & "My Local IP: " & var_loIPVal & linefeed
					set logData to logData & "My Public IP: " & var_puIPVal & linefeed
					set logData to logData & "Destination: " & var_destVal & linefeed
					set logData to logData & "ISP: " & var_ispVal & linefeed
					
				on error
					set logData to logData & "COULD NOT FETCH!" & linefeed
				end try
			-- else
				-- set logData to logData & "Could not click the Details button" & linefeed
			-- end if
			
		-- else
			-- set logData to logData & "DIDN'T FETCH CONNECTION STATUS DETAILS!" & linefeed
			
		-- end if

    end tell
end tell

return logData
