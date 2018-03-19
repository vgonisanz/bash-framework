#!/bin/bash

#
# This script is a sample
#
# Author: Víctor Goñi <vgonisanz@gmail.com>
#

#
# Variables
#
PRINT_SCRIPT="${BASH_SOURCE%/*}/../inc/print.inc"   # This script require print include at common relative folder to work propertly. Change path if needed.
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
}

function f_print_some_icons()
{
    LOGI "Icon POINTS: \t\t${ICON_POINTS}"
    LOGI "Icon TICK: \t\t${ICON_TICK}"
    LOGI "Icon LIGHTINING: \t\t${ICON_LIGHTINING}"
    LOGI "Icon CROSS: \t\t${ICON_CROSS}"
    LOGI "Icon SUN: \t\t${ICON_SUN}"
    LOGI "Icon STAR1: \t\t${ICON_STAR1}"
    LOGI "Icon STAR2: \t\t${ICON_STAR2}"
    LOGI "Icon BOXEMPTY: \t\t${ICON_BOXEMPTY}"
    LOGI "Icon BOXTICKED: \t\t${ICON_BOXTICKED}"
    LOGI "Icon BOXCROSSED: \t\t${ICON_BOXCROSSED}"
    LOGI "Icon DIE: \t\t${ICON_DIE}"
    LOGI "Icon RADIACTIVE: \t\t${ICON_RADIACTIVE}"
    LOGI "Icon SOVIET: \t\t${ICON_SOVIET}"
    LOGI "Icon PEACE: \t\t${ICON_PEACE}"
    LOGI "Icon SMILE: \t\t${ICON_SMILE}"
    LOGI "Icon SUN2: \t\t${ICON_SUN2}"
    LOGI "Icon MOON: \t\t${ICON_MOON}"
    LOGI "Icon GIRL: \t\t${ICON_GIRL}"
    LOGI "Icon BOY: \t\t${ICON_BOY}"
    LOGI "Icon CHESSKING: \t\t${ICON_CHESSKING}"
    LOGI "Icon CHESSQUEEN: \t\t${ICON_CHESSQUEEN}"
    LOGI "Icon CHESSTOWER: \t\t${ICON_CHESSTOWER}"
    LOGI "Icon CHESSBISHOP: \t\t${ICON_CHESSBISHOP}"
    LOGI "Icon CHESSHORSE: \t\t${ICON_CHESSHORSE}"
    LOGI "Icon CHESSPAWN: \t\t${ICON_CHESSPAWN}"
    LOGI "Icon CHESSKING2: \t\t${ICON_CHESSKING2}"
    LOGI "Icon CHESSQUEEN2: \t\t${ICON_CHESSQUEEN2}"
    LOGI "Icon CHESSTOWER2: \t\t${ICON_CHESSTOWER2}"
    LOGI "Icon CHESSBISHOP2: \t\t${ICON_CHESSBISHOP2}"
    LOGI "Icon CHESSHORSE2: \t\t${ICON_CHESSHORSE2}"
    LOGI "Icon CHESSPAWN2: \t\t${ICON_CHESSPAWN2}"
    LOGI "Icon SPADE: \t\t${ICON_SPADE}"
    LOGI "Icon HEART: \t\t${ICON_HEART}"
    LOGI "Icon DIAMOND: \t\t${ICON_DIAMOND}"
    LOGI "Icon CLUB: \t\t${ICON_CLUB}"
    LOGI "Icon SPADE2: \t\t${ICON_SPADE2}"
    LOGI "Icon HEART2: \t\t${ICON_HEART2}"
    LOGI "Icon DIAMOND2: \t\t${ICON_DIAMOND2}"
    LOGI "Icon CROTCHET: \t\t${ICON_CROTCHET}"
    LOGI "Icon QUAVER: \t\t${ICON_QUAVER}"
    LOGI "Icon DQUAVER: \t\t${ICON_DQUAVER}"
    LOGI "Icon FLAT: \t\t${ICON_FLAT}"
    LOGI "Icon NATURAL: \t\t${ICON_NATURAL}"
    LOGI "Icon SHARP: \t\t${ICON_SHARP}"
    LOGI "Icon RECYCLE: \t\t${ICON_RECYCLE}"
    LOGI "Icon WHEELCHAIR: \t\t${ICON_WHEELCHAIR}"
    LOGI "Icon DICE1: \t\t${ICON_DICE1}"
    LOGI "Icon DICE2: \t\t${ICON_DICE2}"
    LOGI "Icon DICE3: \t\t${ICON_DICE3}"
    LOGI "Icon DICE4: \t\t${ICON_DICE4}"
    LOGI "Icon DICE5: \t\t${ICON_DICE5}"
    LOGI "Icon DICE6: \t\t${ICON_DICE6}"
    LOGI "Icon BFLAG: \t\t${ICON_BFLAG}"
    LOGI "Icon WFLAG: \t\t${ICON_WFLAG}"
    LOGI "Icon WORKING: \t\t${ICON_WORKING}"
    LOGI "Icon ANCHOR: \t\t${ICON_ANCHOR}"
    LOGI "Icon BATTLE: \t\t${ICON_BATTLE}"
    LOGI "Icon JUSTICE: \t\t${ICON_JUSTICE}"
    LOGI "Icon CAUTION: \t\t${ICON_CAUTION}"
    LOGI "Icon KEY: \t\t${ICON_KEY}"
    LOGI "Icon PICKAXE: \t\t${ICON_PICKAXE}"
    LOGI "Icon BRIGHT: \t\t${ICON_BRIGHT}"
}

function f_while_true()
{
    LOGI "Info message: Use Cntl + C to exit!"
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
f_print_some_icons
f_while_true
