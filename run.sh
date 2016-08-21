#/bin/bash
ENDL=%0A
sleep 5
IPORIGIN=`curl ipecho.net/plain`
echo $OPENVPN_USERNAME > openvpn-credentials.txt
echo $OPENVPN_PASSWORD >> openvpn-credentials.txt
chmod 600 openvpn-credentials.txt
cp /usr/share/zoneinfo/Europe/Luxembourg /etc/localtime
while true; do
  a=(*);
  FILE_CONFIG=${PWD}/${a[$((RANDOM % ${#a[@]}))]}
  echo $FILE_CONFIG
  openvpn $OPENVPN_OPTS --config "$FILE_CONFIG" &
  sleep 45
  IP=`curl ipecho.net/plain`
  HOSTNAME=`curl ipinfo.io/$IP | jq '.hostname'`
  CITY=`curl ipinfo.io/$IP | jq '.city'`
  COUNTRY=`curl ipinfo.io/$IP | jq '.country'`
  ORG=`curl ipinfo.io/$IP | jq '.org'`
  INFO=`python3 /bin/speedtest-cli --simple`
  LOCALISATION=`curl ipinfo.io/$IP | jq '.loc' | tr -d '"'`
  IFS=', ' read -r -a loc <<< "$LOCALISATION"
  SEPARATOR="-----------------------------------------"
  if [[ "$IPORIGIN" == "$IP" ]]
  then
    echo "*** RETRY NEW VPN FILE ***"
  else
    msg="Hello, new VPN (`basename $FILE_CONFIG`)  at `date +"%T %a %d %h %y"` ${ENDL}${ENDL} $HOSTNAME $IP in ${ENDL} CITY : $CITY ${ENDL} COUNTRY : $COUNTRY ${ENDL} ORGANISATION :  $ORG ${ENDL}$SEPARATOR${ENDL} $INFO"
    ./bot.sh --token=$TOKEN --id=143428947 --latitude=${loc[0]} --longitude=${loc[1]}
    ./bot.sh --token=$TOKEN --id=$USERID --text="$msg"
    sleep $TIMESWITCH
  fi
  pkill openvpn
done
