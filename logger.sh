# colors
red='\033[0;31m'
yellow='\033[1;33m'
green='\033[0;32m'
endColor='\033[0m'

logInfo () {
	message=$1
	echo -e "${yellow}${message}${endColor}"
}

logError () {
	message=$1
	echo -e "${red}${message}${endColor}"
}

logSuccess () {
	message=$1
	echo -e "${green}${message}${endColor}"
}