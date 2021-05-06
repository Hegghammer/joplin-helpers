#!/usr/bin/bash
# Requires Joplin Terminal (https://joplinapp.org/terminal/)
evernote_dir="<full absolute path to the folder with your .enex files>"
for entry in "$evernote_dir"/*.enex
do
  joplin import $entry --format enex --output-format md
done
