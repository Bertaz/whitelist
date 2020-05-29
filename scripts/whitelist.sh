#!/bin/bash
# This script will download and add domains from the rep to whitelist.txt file.
# Project homepage: https://github.com/anudeepND/whitelist
# Licence: https://github.com/anudeepND/whitelist/blob/master/LICENSE
# Created by Anudeep (Slight change by cminion)
#================================================================================
TICK="[\e[32m ✔ \e[0m]"
# PIHOLE_LOCATION="/etc/pihole"
TEMP_LOCATION="/opt/whitelist"
GRAVITY_UPDATE_COMMAND="pihole -w -q"

echo -e " \e[1m This script will download and add domains from the repo to whitelist.txt \e[0m"
echo -e "\n"
echo -e " \e[1m All the domains in this list are safe to add and doesn't contain any tracking or adserving domains. \e[0m"
sleep 1
echo -e "\n"

if [ "$(id -u)" != "0" ] ; then
	echo "This script requires root permissions. Please run this as root!"
	exit 2
fi

# curl -sS https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt | tee "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
cp -f "${TEMP_LOCATION}"/domains/whitelist.txt "${TEMP_LOCATION}"/whitelist.txt.old
echo -e " ${TICK} \e[32m Adding domains to whitelist... \e[0m"
sleep 0.1
echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
# mv "${TEMP_LOCATION}"/whitelist.txt "${TEMP_LOCATION}"/whitelist.txt.old && 
sort -u "${TEMP_LOCATION}"/whitelist.txt.old > "${TEMP_LOCATION}"/whitelist.txt
rm "${TEMP_LOCATION}"/whitelist.txt.old

echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
${GRAVITY_UPDATE_COMMAND} $(xargs < "${TEMP_LOCATION}"/whitelist.txt) --comment "AnudeepND/Whitelist" #> /dev/null
rm "${TEMP_LOCATION}"/whitelist.txt

sleep 0.2

# curl -sS https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/optional-list.txt | tee "${PIHOLE_LOCATION}"/whitelist.txt >/dev/null
cp -f "${TEMP_LOCATION}"/domains/optional-list.txt "${TEMP_LOCATION}"/whitelist.txt.old
echo -e " ${TICK} \e[32m Adding optional domains to whitelist... \e[0m"
sleep 0.1
echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
# mv "${TEMP_LOCATION}"/whitelist.txt "${TEMP_LOCATION}"/whitelist.txt.old && 
sort -u "${TEMP_LOCATION}"/whitelist.txt.old | sed -n '/^\s*$/d; /^#/!p' > "${TEMP_LOCATION}"/whitelist.txt
rm "${TEMP_LOCATION}"/whitelist.txt.old

echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
${GRAVITY_UPDATE_COMMAND} $(xargs < "${TEMP_LOCATION}"/whitelist.txt) --comment "AnudeepND/Optional" #> /dev/null
rm "${TEMP_LOCATION}"/whitelist.txt

echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
echo -e " ${TICK} \e[32m Done! \e[0m"

echo -e " \e[1m  Buy me a coffee: https://paypal.me/anudeepND \e[0m"
echo -e " \e[1m  Star me on GitHub, https://github.com/anudeepND/whitelist \e[0m"
echo -e " \e[1m  Happy AdBlocking :)\e[0m"
echo -e "\n\n"
