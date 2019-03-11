#Dependencies
#BASH, wc, wget, sed
#!/bin/bash
red=$'\e[1;31m'
end=$'\e[0m'
function url_processing() {
wget -q -O /tmp/comparsetemp.html $1
echo "Aquired page source for:" $1
sed 's/<!--/\n\n###\n/g' /tmp/comparsetemp.html | sed 's/-->/\n###\n\n/g' | sed -n -e '/###/,/###/p'
}
printf "Usage:\n ./comparse.sh http://urlofsite/\n ./comparse.sh -f /full/path/to/urllist/file\n\n	urlListFile format:\nhttp://www.google.com/ http://www.tldp.org/ http://www.man.org/\n\n############################################################################################\n"
if [ "$#" -eq 0 ]; then
	printf "%s\n" "${red}SYNTAX ERROR:-->${end} Please enter either a URL or an infile with -f option as shown above in usage\n############################################################################################\n\n"
	exit
fi
if [ "$1" != "-f" ]; then
	url=$1
	echo "Processing URL: "$url
	url_processing $url
else
	if [ "$#" -ne 2 ]; then
		printf "%s\n" "${red}SYNTAX ERROR:-->${end} Please enter a file path after -f option as shown in usage above.\n############################################################################################\n\n"
		exit
	fi
	infile=$2
	num=$(wc -w $infile | cut -d " " -f 1)
	echo "Number of url's Loaded: "$num
	count=0
	while [ $count -lt $num ]; do
		((count++))
		urlff=$(cat $infile | cut -d ' ' -f $count)
		wget -q -O /tmp/comparsetemp.html $urlff
		echo "Aquired page source for:" $urlff
		printf "\n####################################################################################################################################\n\n"
		sed 's/<!--/\n\n###\n/g' /tmp/comparsetemp.html | sed 's/-->/\n###\n\n/g' | sed -n -e '/###/,/###/p' | tee cpurlout.$count
		printf "\n####################################################################################################################################\n\n"
		printf "\n\n\n\n\n\n"
	done

fi
