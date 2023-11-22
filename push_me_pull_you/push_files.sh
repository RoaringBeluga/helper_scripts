#!/bin/sh

usage() {
    echo "Push files with given mask to the Android device"
    echo "$0 -s <source_directory> -d <destination_directory> <file_mask>"
    exit 1
}

SOURCE_DIR="."
DESTINATION_DIR="/storage/emulated/0/Download"
while getopts "hd:s:" arg; do
  case $arg in
    h) # Display help message
      usage
      ;;
    s)
      SOURCE_DIR="$OPTARG"
      ;;
    d)
      DESTINATION_DIR="$OPTARG"
      ;;
    *)
      break
      ;;
  esac
done

if [ -z "$1" ]; then
    usage
fi
shift $((OPTIND-1))

find $SOURCE_DIR -name "$1"  -type f -exec adb push {} $DESTINATION_DIR \;