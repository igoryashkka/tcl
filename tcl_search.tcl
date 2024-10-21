if { $argc < 1 } {
    puts "TCL : There is no args"
    exit 1
}

puts "TCL : all args present in argv[] : $argv"

set file_pattern [lindex $argv 0]

puts "TCL : Searching $file_pattern file"

set dir "./"



proc search_files {dir file_pattern} {
    set flag_found 0
    foreach file [glob  -directory $dir *] {       
        if {[file isdirectory $file]} {
            set sub_dir_flag [search_files $file $file_pattern]
            incr flag_found $sub_dir_flag 
        } else {
            
            if {[string match $file_pattern [file tail $file]]} {
                puts "Found: $file"
                incr flag_found 
            }
        }
    }

    return $flag_found    
}


set result [search_files $dir $file_pattern]

if {$result == 0 } {
   puts "Not Found"
} 

exit 0

