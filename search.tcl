if { $argc < 1 } {
    puts "TCL : Invalid arguments"
    exit 1
}

set file_pattern [lindex $argv 0]
set verbose [lindex $argv 1]

if {$verbose} {
    puts "TCL : Starting search in current directory"
    puts "TCL : Searching for pattern $file_pattern"
}

set total_count 0
proc search_files {dir file_pattern verbose} {
    global total_count
    foreach file [glob -nocomplain -directory $dir *] {
        if {[file isdirectory $file]} {
            search_files $file $file_pattern $verbose
        } elseif {[string match $file_pattern [file tail $file]]} {
            incr total_count
            if {$verbose} {
                puts "TCL : Found file at [file normalize $file]"
            } else {
                puts "[file tail $file]"
            }
        }
    }
}

search_files "./" $file_pattern $verbose
if {$verbose} {
puts "TCL : Total files found: $total_count"
}

exit 0
