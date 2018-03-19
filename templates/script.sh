#!/bin/bash

#
# This script is a sample
#
# Author: Víctor Goñi <vgonisanz@gmail.com>
#

#
# Configuration
#
#set +x             # Uncomment to debug
PRINT_SCRIPT="${BASH_SOURCE%/*}/common/print.inc"   # This script require print include at common relative folder to work propertly. Change path if needed.
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

function f_print_info()
{
    LOGI "Info message: Ok!"
    LOGOK "Ok message: Aw right!"
    LOGW "Warning message: CAUTION!"
    LOGE "Error message: Oh no!"
    LOGV "Verbose message: Is extra info!"
    LOGD "Debug message: Nothing to debug here"

    LOGI "Info message: Use Cntl + C to exit!"
}

function f_while_true()
{
    while true; do
      # Nothing, use ctrl_c
      sleep 1
    done
}

#
# Main
#
[ -f ${PRINT_SCRIPT} ] && source ${PRINT_SCRIPT}
[ $# -ne ${MAX_ARGS} ] && f_usage
f_print_info
f_while_true
