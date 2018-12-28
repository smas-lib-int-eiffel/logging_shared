note
	description: "Summary description for {LOG_CREATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LOG_FACILITY_CREATOR

inherit
	SHARED_LOG_FACILITY

	BASE_PROCESS_FACTORY

	ARGUMENTS

create
	make

feature

	make(a_delete: BOOLEAN)
			--
		local
			l_path:PATH
			l_log_writer_file_rolling_write: LOG_ROLLING_WRITER_FILE
			l_log_file: PLAIN_TEXT_FILE
			l_log_file_name: STRING
			l_log_directory: DIRECTORY
		do
			create l_log_directory.make (Log_dir_name)
			if not l_log_directory.exists then
				l_log_directory.create_dir
				if not l_log_directory.exists then
					print ("ERROR: Could not create log directory! Please verify permissions...%N")
				else
					print ("Log folder created!%N")
				end
			else
				if a_delete then
					create l_path.make_from_string (Log_dir_name + Operating_environment.Directory_separator.out + "log.txt")
					create l_log_file.make_with_path (l_path)
					if l_log_file.exists then
						l_log_file.delete
						print ("log.txt deleted!%N")
					end
				end
			end

			if l_log_directory.exists then
				l_log_file_name := "log_pid_" +  current_process_info.process_id.out + ".txt"
				create l_path.make_from_string (Log_dir_name + Operating_environment.Directory_separator.out + l_log_file_name)
				create l_log_writer_file_rolling_write.make_at_location (l_path)
				l_log_writer_file_rolling_write.set_max_backup_count (10)
				facility.register_log_writer (l_log_writer_file_rolling_write)
				print ("l_log_file_name created and registered at log facility!%N")

				facility.change_all_log_priority (facility.priority_level_information)
			end
		end

feature {NONE} -- Implementation

	Log_dir_name: STRING = "/var/log/shared"
			-- Central general log location, please use symbolic link see #1
end
