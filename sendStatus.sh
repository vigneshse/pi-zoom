#!/bin/bash

LIGHTON=false
while : 
do

  ISMUTED=$(osascript isZoomMuted.applescript)

  if [ $? -eq 0 ]
  then 
    if [ $ISMUTED = "Unmuted" ]
    then
      if [ $LIGHTON = false ];
      then
        printf "turning the light on\n"
        curl -X POST -d "mic=on" "http://raspberrypi.local:5000/zoom"
        if [ $? -eq 0 ]
        then 
          LIGHTON=true
        fi
      fi
      continue
    fi
  fi
  if [ $LIGHTON = true ];
  then
    printf "turning the light off\n"
    curl -X POST -d "mic=off" "http://raspberrypi.local:5000/zoom"
    if [ $? -eq 0 ]
    then
      LIGHTON=false
    fi
  fi
  sleep 1
done
© 2021 GitHub, Inc.
Terms