
# TCL Project

This repository contains scripts and configurations for automating tasks using TCL (Tool Command Language) and Bash. The primary script, `entry.sh`, enables file searching and logging functionality based on input patterns.

## Usage

To run the script, use the following command format:

```bash
./entry.sh 'pattern'
```

### Verbose and Timed Execution

To enable verbose mode and display execution time, use the `-v` and `-t` options:

```bash
./entry.sh -v -t 'main.cpp'
```

## Error Handling

If you encounter permission errors or "no such file" issues, ensure the script has execute permissions. You can add execute permissions using the following command:

```bash
chmod +x entry.sh
```
## Warning
This script has been tested on Linux only. It has not been tested on macOS or Windows.

## Example Output

![Example Output] <img src="data/images/out.jpg" alt="Out image" height="400"/> 

---
