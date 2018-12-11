note
	description: "Summary description for {SHARED_LOG_FACILITY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	SHARED_LOG_FACILITY

feature -- Output

	write_alert (msg: STRING)
			-- Write `msg' to the log writers as an alert
		do
			if not msg.is_empty and facility.log_writer_count > 0 then
				facility.write_alert (msg)
			end
		end

	write_critical (msg: STRING)
			-- Write `msg' to the log writers as an critical
		do
			if not msg.is_empty and facility.log_writer_count > 0 then
				facility.write_critical (msg)
			end
		end

	write_debug (msg: STRING)
			-- Write `msg' to the log writers as an debug
		do
			if not msg.is_empty and facility.log_writer_count > 0 then
				facility.write_debug ( msg)
			end
		end

	write_emergency (msg: STRING)
			-- Write `msg' to the log writers as an emergency
		do
			if not msg.is_empty and facility.log_writer_count > 0 then
				facility.write_emergency (msg)
			end
		end

	write_error (msg: STRING)
			-- Write `msg' to the log writers as an error
		do
			if not msg.is_empty and facility.log_writer_count > 0 then
				facility.write_error (msg)
			end
		end

	write_information (msg: STRING)
			-- Write `msg' to the log writers as an information
		do
			if not msg.is_empty and facility.log_writer_count > 0 then
				facility.write_information (msg)
			end
		end

	write_notice (msg: STRING)
			-- Write `msg' to the log writers as an notice
		do
			if not msg.is_empty and facility.log_writer_count > 0 then
				facility.write_notice ( msg)
			end
		end

	write_warning (msg: STRING)
			-- Write `msg' to the log writers as an warning
		do
			if not msg.is_empty and facility.log_writer_count > 0 then
				facility.write_warning ( msg)
			end
		end

	change_log_priority(a_priority: INTEGER)
			-- Change the log priority of all used log_writers
		do
			facility.change_all_log_priority (a_priority)
		end

feature {NONE} -- Implementation

	facility: LOG_FACILITY_EXTENDED
			 -- Singleton object

		once ("PROCESS")
			create Result.make
		ensure
			singleton_not_void: Result /= Void
		end

	log_string: STRING
			-- Shareable log string, so clients don't have to create a local variable.
		once ("PROCESS")
			create Result.make_empty
		end

note
	copyright: "Copyright (c) 2017-2017, SMA Services"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			SMA Services
			Website: http://www.sma-services.com
		]"

end
