#!/bin/bash
sleep 7
PID=$(ps -e|grep mv_driver_node|awk '{printf $1}')
kill -9 ${PID}
exit 0
