#!/bin/bash
cd /resources
BAK=".bak"

inotifywait -q -r -m -e close_write,moved_to . --format "%w %f" | 
  while read DIR i; do
  cd $DIR
    if [ -d "$i" ]; then
      sleep 1 
    elif [ -f "$i" ]; then
      # Compile if lua file
      if [ ${i: -5} == ".lua" ]; then
        #cp $i $i$BAK
       /app/luac_mta -s -e3 -o $i $i
        echo "[Compiling] $i"
      fi
    fi
  done
