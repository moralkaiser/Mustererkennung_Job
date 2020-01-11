# This script kills the Docker-Container with the given UserHandle

if [ ! -z $1 ]; then
	sudo docker kill "$1-php-test"
else
    RED='\033[0;31m'
	NC='\033[0m' # No Color
	echo -e "$0 :: ${RED}Error${NC} : Insert Userhandle!"
fi

