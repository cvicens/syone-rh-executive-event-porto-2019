
PROJECT_NAME="coolstore"
START=1
END=40

for i in $(seq ${START} ${END}); 
do 
echo $i
oc adm policy add-role-to-user edit system:serviceaccount:${PROJECT_NAME}-${i}:jenkins -n ${PROJECT_NAME}-${i}-dev
oc adm policy add-role-to-user view system:serviceaccount:${PROJECT_NAME}-${i}:jenkins -n ${PROJECT_NAME}-${i}-dev
oc adm policy add-role-to-user system:image-puller system:serviceaccount:${PROJECT_NAME}-${i}-dev:default -n ${PROJECT_NAME}-${i}
done

