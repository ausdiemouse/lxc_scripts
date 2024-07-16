#!/bin/bash

#iptables --flush
#iptables --list
#iptables -L

EXTIP=192.168.1.183

iptables -t nat -I PREROUTING -i enp3s0 -p TCP -d $EXTIP --dport 8001 -j DNAT --to-destination 10.0.3.119:80
iptables -t nat -I PREROUTING -i enp3s0 -p TCP -d $EXTIP --dport 8002 -j DNAT --to-destination 10.0.3.56:80
iptables -t nat -I PREROUTING -i enp3s0 -p TCP -d $EXTIP --dport 8003 -j DNAT --to-destination 10.0.3.178:80
iptables -t nat -I PREROUTING -i enp3s0 -p TCP -d $EXTIP --dport 8004 -j DNAT --to-destination 10.0.3.35:8080
iptables -t nat -I PREROUTING -i enp3s0 -p TCP -d $EXTIP --dport 3000 -j DNAT --to-destination 10.0.3.55:3000
iptables -t nat -I PREROUTING -i enp3s0 -p TCP -d $EXTIP --dport 8005 -j DNAT --to-destination 10.0.3.14:8080

#NAME          STATE   AUTOSTART GROUPS IPV4       IPV6 UNPRIVILEGED 
#lamp          RUNNING 1         -      10.0.3.119 -    false        
#lamp_copy     RUNNING 1         -      10.0.3.65  -    false        
#lighttpd      RUNNING 1         -      10.0.3.56  -    false        
#lighttpd_copy RUNNING 1         -      10.0.3.137 -    false        
#nginx         RUNNING 1         -      10.0.3.178 -    false        
#tomcat        RUNNING 1         -      10.0.3.35  -    false        
#nodejs        RUNNING 1         -      10.0.3.14  -    false        
