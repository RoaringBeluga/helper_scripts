#!/bin/sh
usage () {
    echo "Pull multiple files via ADB. Usage:"
    echo "\t$0 [-e <output_file_suffix>] [-d <destination>] [-s <source_dir>] <filename_pattern>"
}

SUFFIX=""
DEST_DIR="."
SOURCE_DIR="/storage/emulated/0/Download"

while getopts "he:d:s:" arg; do
  case $arg in
    h) # Display help message
      usage
      ;;
    e)
      SUFFIX=".$OPTARG"
      echo "Set suffix to $SUFFIX"
      ;;
    d)
      DEST_DIR="$OPTARG"
      echo "Set destination to $DEST_DIR"
      ;;
    s)
      SOURCE_DIR="$OPTARG"
      echo "Set source to $SOURCE_DIR"
      ;;
    *)
      break
      ;;
  esac
done
shift $((OPTIND-1))

if [ -z "$1" ]; then
    PATTERN="*"
else
    PATTERN="$1"
fi
echo "Set pattern to $PATTERN"

adb shell "find $SOURCE_DIR -name \"$PATTERN\" -type f -print0" | xargs -0 -I @ adb pull @ $DEST_DIR/
find $DEST_DIR -name "$PATTERN" -type f -exec mv {} {}$SUFFIX \;