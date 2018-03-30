###
# TIMESTAMP
#   This include is used to measure time when you execute scripts
###
PRINT_SCRIPT="${BASH_SOURCE%/*}/print.inc"

TS_START_DATE=
TS_LAP_DATE=

function ts_start()
{
    TS_START_DATE=$(date +%s.%N)
    TS_LAP_DATE=$(date +%s.%N)
}

function ts_lap()
{
    TS_LAP_DATE=$(date +%s.%N)
}

function ts_print_lap_time()
{
    local TS_NOW=$(date +%s.%N)

    local dt=$(echo "${TS_NOW} - ${TS_LAP_DATE}" | bc)
    local dd=$(echo "$dt/86400" | bc)
    local dt2=$(echo "$dt-86400*$dd" | bc)
    local dh=$(echo "$dt2/3600" | bc)
    local dt3=$(echo "$dt2-3600*$dh" | bc)
    local dm=$(echo "$dt3/60" | bc)
    local ds=$(echo "$dt3-60*$dm" | bc)

    printf "Total laptime: %d:%02d:%02d:%02.4f\n" $dd $dh $dm $ds
}

function ts_print_total_time()
{
    local TS_NOW=$(date +%s.%N)

    local dt=$(echo "${TS_NOW} - ${TS_START_DATE}" | bc)
    local dd=$(echo "$dt/86400" | bc)
    local dt2=$(echo "$dt-86400*$dd" | bc)
    local dh=$(echo "$dt2/3600" | bc)
    local dt3=$(echo "$dt2-3600*$dh" | bc)
    local dm=$(echo "$dt3/60" | bc)
    local ds=$(echo "$dt3-60*$dm" | bc)

    printf "Total runtime: %d:%02d:%02d:%02.4f\n" $dd $dh $dm $ds
}
