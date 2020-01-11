docker exec -it --user root -w /tensorflow/models/research/volume/ tf_main bash ./organization_shell_scripts/stopTraining.sh

cd /home/teder/mustererkennung_te_pg/volume/training
array_Filenames=($(ls -d model.ckpt-*))
array_ModelVersionNum=()

for i in "${array_Filenames[@]}"
do
    SUBSTRING_RemoveDots=$(echo "$i"| cut -d'.' -f 2)
    # Now only ckpt-VERSION-NUMBER
    SUBSTRING=$(echo "$SUBSTRING_RemoveDots"| cut -d'-' -f 2)
    #echo "$SUBSTRING"
    array_ModelVersionNum+=( "$SUBSTRING" )
done

max=0

for i in "${array_ModelVersionNum[@]}"
do
    max=$( (( $max < $i )) && echo "$i" || echo "$max" )
done

docker exec -it --user root -e PYTHONPATH=$PYTHONPATH:/tensorflow/models/research:/tensorflow/models/research/slim -w /tensorflow/models/research/volume/ tf_main bash ./organization_shell_scripts/createPB.sh $max

