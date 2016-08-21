# docker-openvpn-client

Container openvpn client for PUREVPN provider with auto change IP/sevreur and notification by telegram

## Get kimsufi-availability

```
$ git clone https://github.com/cl3m3nt666/docker-openvpn-client.git
```

## How to use

*Set env value in docker-compose.yml* :

* TOKEN : 12345678:AZERTYAZERTYAZERTYAZERTY

telegram token, contact @botfather

* USERID : 12345678

telegram id, contact @myidbot

* TIMESWITCH : 1800

Define time to change IP/configVPN

* OPENVPN_USERNAME : purevpnXXXXXX

* OPENVPN_PASSWORD : xxxx

* OPENVPN_OPTS : "--inactive 3600 --ping 10 --ping-exit 60"

## How to run

* With docker-compose

```
$ docker-compose up --build -d
```


## When your new VPN found

Telegram message :

```
Hello, new VPN (LEBANON-UDP.ovpn) at 01:59:06 Sun 21 Aug 16

 "No Hostname" XX.XX.XX.XX in
 CITY : "Beirut"
 COUNTRY : "LB"
 ORGANISATION : "AS29073 Quasi Networks LTD."
-----------------------------------------
 Ping: 99.214 ms Download: 29.91 Mbit/s Upload: 17.16 Mbit/s

```
