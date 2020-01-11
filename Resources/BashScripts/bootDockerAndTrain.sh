docker kill tf_main
docker run --runtime=nvidia -v /home/teder/mustererkennung_te_pg/volume:/tensorflow/models/research/volume -itd --rm --name tf_main_container tf_main
docker exec -it --user=root -e PYTHONPATH=$PYTHONPATH:/tensorflow/models/research:/tensorflow/models/research/slim -w /tensorflow/models/research/volume/ tf_main bash ./startDatabuildAndTraining.sh
