# ADB Helper scripts

`push_files.sh` pushes file(s) from the specified directory with the given filemask to the specified directory on device. Default directory on device is `/storage/emulated/0/Download` while default source directory is the directory the script is invoked from.

`pull_files.sh` pulls file(s) from the specified directory on device (defaults to `/storage/emulated/0/Download`) to the specified directory  on the computer (defaults to the directory from which the script is invoked). A suffix may be added to the filename and if no filemask is specified, the default filemask is `*` (all files).`