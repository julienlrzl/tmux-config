#!/bin/zsh
WIFI=$(ipconfig getifaddr en0 2>/dev/null)
if [[ -z "$WIFI" ]]; then
  printf "#[fg=#f38ba8]●"
else
  CHECK=$(curl -s --max-time 2 http://captive.apple.com/hotspot-detect.html 2>/dev/null)
  if [[ "$CHECK" == *"Success"* ]]; then
    printf "#[fg=#a6e3a1]●"
  else
    printf "#[fg=#fab387]●"
  fi
fi
