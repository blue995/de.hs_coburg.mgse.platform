#!/bin/bash

ROOT="$PWD"
FILE="$1"

function check_result {
    RESULT="$1"
    RET_VAL="$2"
    LANG="$3"
    if [[ "$RET_VAL" -ne "0" ]]; then
        echo "An error occurred during the build process of language: $LANG"
        echo "Error:"
        echo "$RESULT"
    else
        echo "Build successful: $LANG"
    fi
}

if [[ -z "$FILE" ]]; then
    echo "Setting default source file"
    FILE="languages.txt"
fi
echo "Source file: $FILE"

if [ ! -f "$FILE" ]; then
    echo "Creating new file: $FILE"
    touch "$FILE"
fi
echo "Building languages defined in source file"

# IFS='' (or IFS=) prevents leading/trailing whitespace from being trimmed.
# -r prevents backslash escapes from being interpreted.
# || [[ -n $line ]] prevents the last line from being ignored if it doesn't end with a \n (since read returns a non-zero exit code when it encounters EOF).
while IFS='' read -r line || [[ -n "$line" ]]; do
    if [[ -d "$line" ]]; then
        echo 
        echo "Visiting directory: $line"
        cd "$line"
        
        echo "Executing gradle build"
        RESULT=$(gradle build)
        RET_VAL="$?"
        check_result "$RESULT" "$RET_VAL" "$line"

        echo "Return to: $ROOT"
        cd "$ROOT"
    fi
done < "$FILE"
