#!/bin/bash

# test

# -o is the short segment, --long for long
# long seperated by ','
# ':' for arguments
OPTS=$(getopt -o rvi:o: --long test,verbose,input:,output: -- "$@")
if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi
echo "$OPTS"
eval set -- "$OPTS"

input='default_in'
output='default_out'
test=false
verbose=false
relative=false

# extract options and their arguments into variables.
# 'shift 2' for arguments and 'shift' for flags
# '|' for long and short opts
while true; do
    case "$1" in
        -i | --input )
            input="$2"
            shift 2
            ;;
        -o | --output )
            output="$2"
            shift 2
            ;;
        -v | --verbose ) verbose=true; shift ;;
        -r ) relative=true; shift ;;
        --test ) test=true; shift ;;
        -- ) shift; break ;;
        # Shouldn't be necessary
        # * ) break ;;
    esac
done

# stdin is not a terminal (something was piped)
# either one method or the other
if [ ! -t 0 ]; then
    # stdin line by line
    while IFS= read -r line; do
        echo "Processing: $line"
    done

    # stdin all at once
    # input_data=$(cat)
    # echo "Received: $input_data"
fi

# echo opts
echo "input: $input"
echo "output: $output"
echo "test: $test"
echo "verbose: $verbose"
echo "relative: $relative"

# echo positional args
echo "Positional arguments: $@"
echo "First positional arg: $1"
echo "Second positional arg: $2"

