# This script creates and launches the Docker Container with the userHandle

if [ ! -z $1 ]; then
	cd ..
	cd UserContainerVolumes
	cd $1

	userDirVolumePath=$(pwd)
	
	cd ..
	cd ..
	cd TrainingWorkloadManagement
	workloadManagementDirVolumePath=$(pwd)

	containerName="$1-php-test"

	sudo docker run -i -d --rm -v "$userDirVolumePath:/userFiles" -v "$workloadManagementDirVolumePath:/workloadManagement" --name="$containerName" php-test
else
	RED='\033[0;31m'
	NC='\033[0m' # No Color
	echo -e "$0 :: ${RED}Error${NC} : Insert Userhandle!"
fi
