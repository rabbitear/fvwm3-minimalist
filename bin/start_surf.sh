#!/usr/local/bin/bash 

clipboard="$(xsel -o -b)"
if [[ $clipboard =~ ^https://(www.)?youtu\.?be ]] then
  echo "youtube mpv: $clipboard" >> ~/.fvwm/fvwm3-output.log
  xterm -T YouTube -font 8x16 +sb -geometry 76x2+259+0 -e mpv --geometry=640x480 --ytdl-format=mp4 --profile=fast --hwdec=auto-safe "$clipboard" &
elif [[ $clipboard =~ ^https?: ]] then
  echo "clipboard = $clipboard" >> ~/.fvwm/fvwm3-output.log 
  /usr/local/bin/surf -z 1.0 "$clipboard" 2>/dev/null &
  echo '+ I Wait Surf'
  echo '+ I Next (Surf) WarpToWindow +44p +20p'
  echo '+ I Next (Surf) Raise 750p 440p'
else
  echo "loading ddg: $clipboard" >> ~/.fvwm/fvwm3-output.log 
  /usr/local/bin/surf -z 1.6 https://duckduckgo.com/lite/?q="$clipboard" 2>/dev/null &
  echo '+ I Wait Surf'
  echo '+ I Next (Surf) WarpToWindow +44p +20p'
  echo '+ I Next (Surf) Raise 600p 150p'
fi

