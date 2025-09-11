set logData to ""

tell application "Versa SASE Client" to activate
delay 0.5

tell application "System Events"
    tell process "Versa SASE Client"
	
		set position of window 1 to {0, 0}
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
			set var_gateway to value of static text 3 of window 1
			set logData to logData & var_gateway & linefeed
        on error
            set logData to logData & "Could not fetch Gateway" & linefeed
        end try
		
		if exists static text "Connection Status" of window 1 then
			click button "Connection Status" of window 1
			delay 0.4
			-- if exists static text "Details" of window 1 then
				-- click button "Details" of window 1
				-- set var_detailsButton to value of button 7 of window 1
				-- set logData to logData & var_detailsButton & linefeed
				-- if exists button 1 of UI element 1 of row 1 of table 1 of scroll area 1 of window 1 then
				if exists static text "Details" of UI element 1 of row 1 of table 1 of scroll area 1 of window 1 then
					display notification "IT IS AVAILABLE!"
					delay 0.4
					click static text "Details" of UI element 1 of row 1 of table 1 of scroll area 1 of window 1
				else
					display notification "NOT AVAILABLE!"
				end if
				delay 0.4
				try
					set var_type to value of static text 5 of window 1
					set var_authentication to value of static text 7 of window 1
					set var_encyption to value of static text 9 of window 1
					set var_tunnelAddress to value of static text 11 of window 1
					set var_networkAdapto to value of static text 13 of window 1
					set var_localIP to value of static text 15 of window 1
					set var_publicIP to value of static text 17 of window 1
					set var_destination to value of static text 19 of window 1
					set var_isp to value of static text 21 of window 1
					
					set logData to logData & var_type & linefeed
					set logData to logData & var_authentication & linefeed
					set logData to logData & var_encyption & linefeed
					set logData to logData & var_tunnelAddress & linefeed
					set logData to logData & var_networkAdapto & linefeed
					set logData to logData & var_localIP & linefeed
					set logData to logData & var_publicIP & linefeed
					set logData to logData & var_destination & linefeed
					set logData to logData & var_isp & linefeed
					
				on error
					set logData to logData & "COULD NOT FETCH!" & linefeed
				end try
			-- else
				-- set logData to logData & "Could not click the Details button" & linefeed
			-- end if
			
		else
			set logData to logData & "DIDN'T FETCH CONNECTION STATUS DETAILS!" & linefeed
			
		end if

    end tell
end tell

return logData
