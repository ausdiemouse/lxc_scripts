#!/bin/bash

#Desc: script maps container ips and ports to host ip and ports. Uses whichever interface is available first fromm ip a

#iptables --flush
#iptables --list
#iptables -L

#following line populates $EXTIP with the host ip automatically 
#EXTIP=$(ip a | grep enp | grep inet | awk '{print $2}'| sed 's/\/.*//')
#this is alternative to the previous line 
#EXTIP=$(ip a | grep -A2 "enp3s0" | grep "inet " | awk '{print $2}' | cut -d/ -f1)

#following line populates $EXTIP with the host ip automatically on ethernet / wireless interface
EXTIP=$(ip a | grep -E "enp|wlan" | grep inet | awk '{print $2; exit}'| sed 's/\/.*//')


# n/w interface capture starts ---------------

#reads in either the ethernet or wifi interface whichever is first. or whichever is up 
#interface=$(ip a | grep -E "enp|wlan" | grep "state UP"| awk '{print $2; exit}'| sed 's/:.*//')
#improved spawns lesser processes -in AI we trust ... tested works. query:"more efficient and compact"
interface=$(ip -o link show | awk -F': ' '/wlan|enp/ && /state UP/{print $2; exit}')

# n/w interface capture ends x-----ls------------xd


#this was the legacy manual update of the host ip
#EXTIP=192.168.1.183

echo "interface: $interface"
echo "ip: $EXTIP"

#The following similar lines map the containers ip and ports to the host ip and port of choice for external access over the network
#for ethernet interface and corresponding ip 	#need to re-write for ip block redundancy
iptables -t nat -I PREROUTING -i $interface -p TCP -d $EXTIP --dport 8001 -j DNAT --to-destination 10.0.3.119:80
iptables -t nat -I PREROUTING -i $interface -p TCP -d $EXTIP --dport 8002 -j DNAT --to-destination 10.0.3.56:80
iptables -t nat -I PREROUTING -i $interface -p TCP -d $EXTIP --dport 8003 -j DNAT --to-destination 10.0.3.178:80
iptables -t nat -I PREROUTING -i $interface -p TCP -d $EXTIP --dport 8004 -j DNAT --to-destination 10.0.3.35:8080
iptables -t nat -I PREROUTING -i $interface -p TCP -d $EXTIP --dport 3000 -j DNAT --to-destination 10.0.3.55:3000
iptables -t nat -I PREROUTING -i $interface -p TCP -d $EXTIP --dport 8005 -j DNAT --to-destination 10.0.3.14:8080


#Reference of containers
#NAME          STATE   AUTOSTART GROUPS IPV4       IPV6 UNPRIVILEGED 
#lamp          RUNNING 1         -      10.0.3.119 -    false        
#lamp_copy     RUNNING 1         -      10.0.3.65  -    false        
#lighttpd      RUNNING 1         -      10.0.3.56  -    false        
#lighttpd_copy RUNNING 1         -      10.0.3.137 -    false        
#nginx         RUNNING 1         -      10.0.3.178 -    false        
#tomcat        RUNNING 1         -      10.0.3.35  -    false        
#nodejs        RUNNING 1         -      10.0.3.14  -    false        
