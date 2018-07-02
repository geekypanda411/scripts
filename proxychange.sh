#!/bin/bash
printf "USAGE: ./chprox.sh option host:port \n[OPTIONS]\n-s	for setting given proxy value\n-u	to unset proxy value\n\n\n"
if [ $1 == "-s" ];
then
	if [ $# -eq 2 ];
	then
		# Set Proxy
		export {http,ftp}_proxy="http://$2"
		export https_proxy="https://$2"
		echo "Proxy Set to $2"
	else
		printf "PLEASE USE CORRECT OPTIONS \nUSAGE: ./chprox.sh option host:port \n[OPTIONS]\n-s     for setting given proxy value\n-u       to unset proxy value\n"
	fi
elif [ $1 == "-u" ];
then
	# Unset Proxy
	unset {http,https,ftp}_proxy
	echo "Proxy Unset"
else
	printf "PLEASE USE CORRECT OPTIONS \nUSAGE: ./chprox.sh option host:port \n[OPTIONS]\n-s     for setting given proxy value\n-u       to unset proxy value\n"
fi 2>/dev/null
