cd ..
cd ..
userhandleRAW="`cat userhandle.csv`"
userhandle=$(echo "$userhandleRAW" | cut -d ',' -f 2)
echo "tf_trainingcontainer_$userhandle"


docker kill "tf_trainingcontainer_$userhandle"
docker run --network=tf_containerlink_$userhandle --runtime=nvidia -v /home/teder/testArchiv/Mustererkennung_Job/UserContainerVolumes/$userhandle:/tensorflow/models/research/volume -itd --rm --name "tf_trainingcontainer_$userhandle" tf_trainingcontainer_student:latest
#docker exec -it --user=root -e PYTHONPATH=$PYTHONPATH:/tensorflow/models/research:/tensorflow/models/research/slim -w /tensorflow/models/research/volume/scripts/bash "tf_trainingcontainer_$userhandle" bash ./startDatabuildAndTraining.sh

