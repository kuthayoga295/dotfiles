#!/bin/bash
# not connected
if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
 echo "%{F#ED553B}%{F-} Off"
else
 # connected, but no device
 if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
 then
   echo "%{F#F6D55C}%{F-} On"
 else
   # get device alias
   DEVICE=`echo info | bluetoothctl | grep 'Alias:' | awk -F:  '{ print $2 }'`
   if [[ -z "${DEVICE// }" ]];
   then
     echo "%{F#3CAEA3}%{F-} On"
   else
     echo "%{F#20639B}%{F-} $DEVICE"
   fi
 fi
fi

