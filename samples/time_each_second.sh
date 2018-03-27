#!/bin/bash

#
# This script is a sample
#
# Author: Víctor Goñi <vgonisanz@gmail.com>
#

#
# Variables
#
PRINT_SCRIPT="${BASH_SOURCE%/*}/../inc/print.inc"
MAX_ARGS=0

#
# Traps
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
    echo "${YELLOW}Usage: $0 ${NORMAL}"
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

function f_print_info()
{
    LOGI "Ok!"
    LOGW "Warning message!"
    LOGE "Error message!"
    LOGD "Use Cntl + C to exit!"
}

function f_print_date()
{
    while true; do
      # Nothing, use ctrl_c
      DATE=$(date +%T)
      LOGI "Current time ${DATE}"
      sleep 1s
    done
}
#
# Main
#
[ -f ${PRINT_SCRIPT} ] && source ${PRINT_SCRIPT}
[ $# -ne ${MAX_ARGS} ] && f_usage

f_print_date
