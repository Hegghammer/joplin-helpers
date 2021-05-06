#!/usr/bin/bash
# https://stackoverflow.com/questions/2709458/how-to-replace-spaces-in-file-names-using-a-bash-script
for f in *\ *; do mv "$f" "${f// /_}"; done
