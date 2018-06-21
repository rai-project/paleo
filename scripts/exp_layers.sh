#! /bin/sh

PPP_COMP=0.62
DEVICE_NAME=$1
NET_FILE=$2
OUT_FILE="$3_$PPP_COMP"


pushd ..

# Summary
./paleo.sh summary $NET_FILE > $OUT_FILE

# Fullpass Tensorflow execution
echo '\n\n' >> $OUT_FILE
./paleo.sh fullpass $NET_FILE >> $OUT_FILE

# Layerwise profiling
echo '\n\n' >> $OUT_FILE
./paleo.sh profile $NET_FILE \
    --direction=forward \
    --executor=cudnn \
    --ppp_comp=$PPP_COMP \
    --device_name=$DEVICE_NAME \
    >> $OUT_FILE
./paleo.sh profile $NET_FILE \
    --direction=forward \
    --executor=tensorflow \
    --device_name=$DEVICE_NAME \
    >> $OUT_FILE

echo '\n\n' >> $OUT_FILE
./paleo.sh profile $NET_FILE \
    --direction=backward \
    --gradient_wrt=data \
    --executor=cudnn \
    --ppp_comp=$PPP_COMP \
    --device_name=$DEVICE_NAME \
    >> $OUT_FILE
./paleo.sh profile $NET_FILE \
    --direction=backward \
    --gradient_wrt=data \
    --executor=tensorflow \
    --device_name=$DEVICE_NAME \
    >> $OUT_FILE

echo '\n\n' >> $OUT_FILE
./paleo.sh profile $NET_FILE \
    --direction=backward \
    --gradient_wrt=filter \
    --executor=cudnn \
    --ppp_comp=$PPP_COMP \
    --device_name=$DEVICE_NAME \
    >> $OUT_FILE
./paleo.sh profile $NET_FILE \
    --direction=backward \
    --gradient_wrt=filter \
    --executor=tensorflow \
    --device_name=$DEVICE_NAME \
    >> $OUT_FILE

popd
