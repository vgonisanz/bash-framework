#!/bin/bash

#
# This script is a sample for get timestamp in execution using timestamp.inc
#
# Author: Víctor Goñi <vgonisanz@gmail.com>
#

#
# Configuration
#
#set +x             # Uncomment to debug
PRINT_SCRIPT="${BASH_SOURCE%/*}/../inc/print.inc"
TS_SCRIPT="${BASH_SOURCE%/*}/../inc/timestamp.inc"
MAX_ARGS=0

#
# Variables: Put your variables here
#


#
# Installing Traps
#
# Possible args: SIGQUIT, SIGTSTP, SIGTTIN, SIGTTOU, SIGINT, SIGTERM
#

trap f_ctrl_c SIGINT
trap f_ctrl_c SIGTERM

#
# Functions
#
function f_usage()
{
    echo ""
    LOGW "Usage: $0"
    echo ""
    exit 1
}

function f_handle_error()
{
    local msg=$1
    LOGD "${msg}"
    exit 2
}

function f_ctrl_c()
{
    f_handle_error "Control+C sequence pressed..."
}

function f_test()
{
    LOGI "Testing..."
    res1=$(date +%s.%N)

    # do stuff in here

    res2=$(date +%s.%N)
    dt=$(echo "$res2 - $res1" | bc)
    dd=$(echo "$dt/86400" | bc)
    dt2=$(echo "$dt-86400*$dd" | bc)
    dh=$(echo "$dt2/3600" | bc)
    dt3=$(echo "$dt2-3600*$dh" | bc)
    dm=$(echo "$dt3/60" | bc)
    ds=$(echo "$dt3-60*$dm" | bc)

    printf "Total runtime: %d:%02d:%02d:%02.4f\n" $dd $dh $dm $ds
}

function f_timestamp()
{
    ts_start                # Start ~0s
    sleep 1
    ts_print_lap_time       # Lap shall be ~1s
    ts_print_total_time     # Total time shall be ~1s too
    ts_lap                  # Set lap to current time
    sleep 2
    ts_print_lap_time       # Lap shall be ~2s now
    ts_print_total_time     # Total time shall be ~3s now
}

#
# Main
#
[ -f ${PRINT_SCRIPT} ] && source ${PRINT_SCRIPT}
[ -f ${TS_SCRIPT} ] && source ${TS_SCRIPT}
[ $# -ne ${MAX_ARGS} ] && f_usage
f_timestamp
