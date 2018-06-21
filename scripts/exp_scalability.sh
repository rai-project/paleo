#! /bin/sh

DEVICE_NAME=$1

if [ ! -d "../results/$DEVICE_NAME" ]; then
    mkdir -p ../results/$DEVICE_NAME
    echo "made dir results/$DEVICE_NAME"
fi


PPP_COMP=$2 # 0.62
PPP_COMM=$3 # 1.0
NET_FILE=$4

OUT_FILE="results/$DEVICE_NAME/scalability_$2_$3_$4"

# Scalability simulation.

pushd ..

./paleo.sh simulate "nets/$NET_FILE.json" \
    --batch_size=32\
    --network_name=pcie3 \
    --device_name=$DEVICE_NAME \
    --ppp_comp=$PPP_COMP \
    --ppp_comm=$PPP_COMM \
    --scaling=strong,weak >> $OUT_FILE

# ./paleo.sh simulate "nets/$NET_FILE.json" \
#     --batch_size=256 \
#     --network_name=pcie3 \
#     --device_name=$DEVICE_NAME\
#     --ppp_comp=$PPP_COMP \
#     --ppp_comm=$PPP_COMM \
#     --scaling=strong,weak >> $OUT_FILE

popd
