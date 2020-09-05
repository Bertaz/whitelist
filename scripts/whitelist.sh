#!/bin/bash
# This script will download and add domains from the rep to whitelist.txt file.
# Project homepage: https://github.com/anudeepND/whitelist
# Licence: https://github.com/anudeepND/whitelist/blob/master/LICENSE
# Created by Anudeep (Slight change by Bertaz)
#================================================================================
TICK="[\e[32m ✔ \e[0m]"
WARN="[\e[33m ⚠ \e[0m]"
CROSS="[\e[31m ✖ \e[0m]"
# PIHOLE_LOCATION="/etc/pihole"
TEMP_LOCATION="/opt/whitelist"
GRAVITY_UPDATE_COMMAND="pihole -w -q"
GRAVITY_REMOVE_COMMAND="pihole -w -q -d"

echo -e "\n\e[1m This script will download and add domains from the repo to whitelist.txt \e[0m"
echo -e "\e[1m All the domains in this list are safe to add and doesn't contain any tracking or adserving domains. \e[0m\n"
sleep 1

if [ "$(id -u)" != "0" ]; then
	echo "This script requires root permissions. Please run this as root!"
	exit 2
fi


if [ -r "${TEMP_LOCATION}"/whitelist.txt ]; then
	echo -e " ${TICK} \e[32m Removing old domains from whitelist... \e[0m"
	${GRAVITY_REMOVE_COMMAND} $(xargs < "${TEMP_LOCATION}"/whitelist.txt) --comment "AnudeepND/Whitelist"
else
	echo -e " ${WARN} \e[33m No previous whitelisted domains \e[0m"
fi

if [ -r "${TEMP_LOCATION}"/domains/whitelist.txt ]; then
	cp -f "${TEMP_LOCATION}"/domains/whitelist.txt "${TEMP_LOCATION}"/whitelist.txt.old
	echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
	sort -u "${TEMP_LOCATION}"/whitelist.txt.old | sed -n '/^\s*$/d; /^#/!p' > "${TEMP_LOCATION}"/whitelist.txt
	rm "${TEMP_LOCATION}"/whitelist.txt.old

	echo -e " ${TICK} \e[32m Adding domains to whitelist... \e[0m"
	sleep 0.1
	echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
	${GRAVITY_UPDATE_COMMAND} $(xargs < "${TEMP_LOCATION}"/whitelist.txt) --comment "AnudeepND/Whitelist"
	#rm "${TEMP_LOCATION}"/whitelist.txt

	sleep 5
else
	echo -e " ${CROSS} \e[31mCouldn't find whitelist file, trying optional domains\e[0m"
	NUMDON=FALSE
fi

if [ -r "${TEMP_LOCATION}"/optional-list.txt ]; then
	echo -e " ${TICK} \e[32m Removing old optional domains from whitelist... \e[0m"
	${GRAVITY_REMOVE_COMMAND} $(xargs < "${TEMP_LOCATION}"/optional-list.txt) --comment "AnudeepND/Optional"
else
	echo -e " ${WARN} \e[33m No previous whitelisted optional domains \e[0m"
fi

if [ -r "${TEMP_LOCATION}"/domains/optional-list.txt ]; then
	cp -f "${TEMP_LOCATION}"/domains/optional-list.txt "${TEMP_LOCATION}"/optional-list.txt.old
	echo -e " ${TICK} \e[32m Removing duplicates... \e[0m"
	sort -u "${TEMP_LOCATION}"/optional-list.txt.old | sed -n '/^\s*$/d; /^#/!p' > "${TEMP_LOCATION}"/optional-list.txt
	rm "${TEMP_LOCATION}"/optional-list.txt.old

	echo -e " ${TICK} \e[32m Adding optional domains to whitelist... \e[0m"
	sleep 0.1
	echo -e " [...] \e[32m Pi-hole gravity rebuilding lists. This may take a while... \e[0m"
	${GRAVITY_UPDATE_COMMAND} $(xargs < "${TEMP_LOCATION}"/optional-list.txt) --comment "AnudeepND/Optional"
	#rm "${TEMP_LOCATION}"/optional-list.txt
else
	echo -e " ${CROSS} \e[31mCouldn't find optional list file\e[0m\n"
	[ $NUMDON ] && echo -e " \e[31mBoth lists missing, aborting!\n Execute git pull in this directory to download necessary files\e[0m\n" && exit 2
fi

# Done
echo -e " ${TICK} \e[32m Pi-hole's gravity updated \e[0m"
echo -e " ${TICK} \e[32m Done! \e[0m"

echo -e " \e[1m  Buy me a coffee: https://paypal.me/anudeepND \e[0m"
echo -e " \e[1m  Star me on GitHub, https://github.com/anudeepND/whitelist \e[0m"
echo -e " \e[1m  Happy AdBlocking :)\e[0m\n"
