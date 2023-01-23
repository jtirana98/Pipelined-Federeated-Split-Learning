#!/bin/bash -xe

mkdir -p /root/experiments/simulations/dataowners_$1_

declare -i y=0
y=$((  $1 - 1))

for i in $(seq 2 1 $1)
do
    y=$(( 8081 + $i ))
    sudo iptables -I INPUT -p tcp -m tcp --dport $y -j ACCEPT
    ../../build/simulated_data_owner $i > /root/experiments/simulations/dataowners_$1_/d$i.data &
done

../../build/simulated_data_owner 0 0,1,3,4,5 > /root/experiments/simulations/dataowners_$1_/d0.data &