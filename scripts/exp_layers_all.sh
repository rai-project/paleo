#! /bin/sh

DEVICE_NAME=$1

if [ ! -d "../results/$DEVICE_NAME" ]; then
    mkdir -p ../results/$DEVICE_NAME
    echo "made dir results/$DEVICE_NAME"
fi

# AlexNet
./exp_layers.sh $DEVICE_NAME nets/alex_v2.json results/$DEVICE_NAME/layers_alex_v2

# VGG16
./exp_layers.sh $DEVICE_NAME nets/vgg16.json results/$DEVICE_NAME/layers_vgg16

# resnet50
./exp_layers.sh $DEVICE_NAME nets/resnet50.json results/$DEVICE_NAME/layers_resnet50

# Overfeat
# ./exp_layers.sh $DEVICE_NAME nets/overfeat.json results/$DEVICE_NAME/layers_overfeat

