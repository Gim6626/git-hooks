#!/usr/bin/env bash

TARGET_DIRECTORIES_FILE=$1

set -e
set -u

USAGE="$0 TARGET_DIRECTORIES_FILE"
if [ -z "$TARGET_DIRECTORIES_FILE" ]
then
    echo $USAGE
    exit 1
fi
SCRIPT_DIRECTORY="$(dirname "${BASH_SOURCE[0]}")"

while read TARGET_DIRECTORY
do
    echo "Installing hooks to \"$TARGET_DIRECTORY\""
    HOOK_FILENAME="commit-msg"
    HOOK_FILE="$SCRIPT_DIRECTORY/$HOOK_FILENAME"
    if [ ! -e "$TARGET_DIRECTORY" ]
    then
        echo "WARNING: \"$TARGET_DIRECTORY\" does not exist, creating"
        mkdir -p "$TARGET_DIRECTORY"
    fi
    if [ ! -d "$TARGET_DIRECTORY" ]
    then
        echo "ERROR: \"$TARGET_DIRECTORY\" exists but is not a directory, terminating"
        exit 1
    fi
    HOOK_DESTINATION=$TARGET_DIRECTORY/$HOOK_FILENAME
    cp "$HOOK_FILE" "$HOOK_DESTINATION"
    echo "Setting execution rights for \"$HOOK_DESTINATION\""
    chmod +x "$HOOK_DESTINATION"
done <"$TARGET_DIRECTORIES_FILE"
