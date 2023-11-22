#!/bin/sh

# Push test files to the device's Downloads directory
sh push_files.sh -s ./test_data -d /storage/emulated/0/Download *.dat

# Pull the files from the device, adding a suffix
sh pull_files.sh -e pulled -d test_pull -s /storage/emulated/0/Download "*.dat"