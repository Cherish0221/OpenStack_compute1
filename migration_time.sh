#!/bin/bash
time1=`grep 'after 0 sec elapsed time' /var/log/nova/nova-compute.log | tail -n 1 |awk '{print $2}'`;
time2=`grep 'Migrating instance to compute2 finished successfully' /var/log/nova/nova-compute.log | tail -n 1 | awk '{print $2}'`;
# 计算时间差
time=$(($(date +%s -d $time2) - $(date +%s -d $time1)));
echo "$time s";
