#!/usr/local/bin/bash 

clipboard="$(xsel -o -b)"
if [[ $clipboard =~ ^https?: ]] then
  echo "clipboard = $clipboard" >> ~/.fvwm/fvwm3-output.log 
  /usr/local/bin/surf -z 1.0 "$clipboard" 2>/dev/null &
else
  echo "loading ddg: $clipboard" >> ~/.fvwm/fvwm3-output.log 
  /usr/local/bin/surf -z 1.6 https://duckduckgo.com/lite/?q="$clipboard" 2>/dev/null &
fi

