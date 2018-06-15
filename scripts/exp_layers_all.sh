#! /bin/sh

# AlexNet
./exp_layers.sh nets/alex_v2.json results/layers_alex_v2

# VGG16
./exp_layers.sh nets/vgg16.json results/layers_vgg16

# resnet50
./exp_layers.sh nets/resnet50.json results/layers_resnet50

# Overfeat
# ./exp_layers.sh nets/overfeat.json results/layers_overfeat

