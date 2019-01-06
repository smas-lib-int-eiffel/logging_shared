note
	description: "Summary description for {LOG_FACILITY_EXTENDED}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LOG_FACILITY_EXTENDED

inherit
	LOG_LOGGING_FACILITY
		redefine
			make
		end

create
	make

feature -- Creation

	make
		do
			Precursor
		end

feature -- Element Change

	change_all_log_priority(a_priority: INTEGER)
		require
			correct_priority: is_correct_priority(a_priority)
		local
			l_list: like log_writer_list
		do
			l_list := log_writer_list
			extended_priority := -1
			from
				l_list.start
			until
				l_list.after
			loop
				if a_priority = Log_emergency then
					l_list.item.enable_emergency_log_level
					extended_priority := a_priority
				end
				if a_priority = Log_alert then
					l_list.item.enable_alert_log_level
					extended_priority := a_priority
				end
				if a_priority = Log_critical then
					l_list.item.enable_critical_log_level
					extended_priority := a_priority
				end
				if a_priority = Log_error then
					l_list.item.enable_error_log_level
					extended_priority := a_priority
				end
				if a_priority = Log_warning then
					l_list.item.enable_warning_log_level
					extended_priority := a_priority
				end
				if a_priority = Log_notice then
					l_list.item.enable_notice_log_level
					extended_priority := a_priority
				end
				if a_priority = Log_information then
					l_list.item.enable_information_log_level
					extended_priority := a_priority
				end
				if a_priority = Log_debug then
					l_list.item.enable_debug_log_level
					extended_priority := a_priority
				end
				l_list.forth
			end
		ensure
			log_writers_registered: log_writer_count > 0
		end

	change_all_log_priority_from_string(a_priority_as_string: STRING)
		require
			correct_priority: is_priority_mappable(a_priority_as_string)
		local
			l_list: like log_writer_list
		do
			l_list := log_writer_list
			extended_priority := -1
			from
				l_list.start
			until
				l_list.after
			loop
				if a_priority_as_string.is_equal("debug") then
					l_list.item.enable_debug_log_level
					extended_priority := Log_debug
				end
				if a_priority_as_string.is_equal("emergency") then
					l_list.item.enable_emergency_log_level
					extended_priority := Log_emergency
				end
				if a_priority_as_string.is_equal("alert") then
					l_list.item.enable_alert_log_level
					extended_priority := Log_alert
				end
				if a_priority_as_string.is_equal("critical") then
					l_list.item.enable_critical_log_level
					extended_priority := Log_critical
				end
				if a_priority_as_string.is_equal("error") then
					l_list.item.enable_error_log_level
					extended_priority := Log_error
				end
				if a_priority_as_string.is_equal("warning") then
					l_list.item.enable_warning_log_level
					extended_priority := Log_warning
				end
				if a_priority_as_string.is_equal("notification") then
					l_list.item.enable_notice_log_level
					extended_priority := Log_notice
				end
				if a_priority_as_string.is_equal("information") then
					l_list.item.enable_information_log_level
					extended_priority := Log_information
				end
				l_list.forth
			end
		ensure
			log_writers_registered: log_writer_count > 0
		end

feature -- Status

	priority_level_debug: INTEGER
		do
			Result := log_debug
		end

	priority_level_emergency: INTEGER
		do
			Result := log_emergency
		end

	priority_level_alert: INTEGER
		do
			Result := log_alert
		end

	priority_level_critical: INTEGER
		do
			Result := log_critical
		end

	priority_level_error: INTEGER
		do
			Result := log_error
		end

	priority_level_warning: INTEGER
		do
			Result := log_warning
		end

	priority_level_notice: INTEGER
		do
			Result := log_notice
		end

	priority_level_information: INTEGER
		do
			Result := log_information
		end

	priority_out: STRING
			-- Report the priority as a human readable string
		do
			if extended_priority = Log_debug then
				Result := "debug"
			elseif extended_priority = Log_emergency then
				Result := "emergency"
			elseif extended_priority = Log_alert then
				Result := "alert"
			elseif extended_priority = Log_critical then
				Result := "critical"
			elseif extended_priority = Log_error then
				Result := "error"
			elseif extended_priority = Log_warning then
				Result := "warning"
			elseif extended_priority = Log_notice then
				Result := "notification"
			elseif extended_priority = Log_information then
				Result := "information"
			else
				Result := "unknown"
			end
		end

	is_correct_priority(a_priority: INTEGER): BOOLEAN
		do
			Result := not priority_tag(a_priority).is_equal(unkno_str)
		end

	is_priority_mappable(a_priority_as_string: STRING): BOOLEAN
			-- True, when a_priority_string is mappable to a known log priority
		do
			if a_priority_as_string.is_equal("debug") then
				Result := True
			elseif a_priority_as_string.is_equal("emergency") then
				Result := True
			elseif a_priority_as_string.is_equal("alert") then
				Result := True
			elseif a_priority_as_string.is_equal("critical") then
				Result := True
			elseif a_priority_as_string.is_equal("error") then
				Result := True
			elseif a_priority_as_string.is_equal("warning") then
				Result := True
			elseif a_priority_as_string.is_equal("notification") then
				Result := True
			elseif a_priority_as_string.is_equal("information") then
				Result := True
			end
		end

	extended_priority: INTEGER
			-- For now store the priority value set with

end
