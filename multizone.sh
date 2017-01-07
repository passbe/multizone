#!/bin/bash 

# List of timezones to output
# Values must align to /usr/share/zoneinfo/[value]
declare -A timezones
timezones=(
    ["UTC"]="UTC"
    ["Brisbane"]="Australia/Brisbane"
    ["Sydney"]="Australia/Sydney"
    ["Melbourne"]="Australia/Melbourne"
    ["Perth"]="Australia/Perth"
    ["Montreal"]="Canada/Eastern"
    ["Salt Lake City"]="US/Mountain"
    ["Mongolia"]="Asia/Ulaanbaatar"
    ["New York"]="US/Eastern"
    ["China"]="Asia/Shanghai"
    ["Russia"]="Europe/Moscow"
    ["India"]="Asia/Kolkata"
)

# Format to output date
# Note: column command uses '|' as separator
date_format="%H:%M %a %e %b|%:z"

# Loop over and output dates
for t in "${!timezones[@]}"; do 
    date=$(TZ=/usr/share/zoneinfo/"${timezones[$t]}" date +"$date_format")
    printf "%s|%s|%s\n" "${t}" "${date}" "${timezones[$t]}"
    sleep 0.1
done | sort | column -t -s '|'
