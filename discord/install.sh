# Discord
DISCORD_BOT_TOKEN_PATH=/var/local/DISCORD_BOT_TOKEN

sudo touch $DISCORD_BOT_TOKEN_PATH

DISCORD_BOT_TOKEN=$(cat $DISCORD_BOT_TOKEN_PATH)

UPDATE=""

if [[ "${#DISCORD_BOT_TOKEN}" -gt 0 ]]; then
	echo ""
	echo "Current Discord Bot Token: ${DISCORD_BOT_TOKEN:0:4}**********"

	while [[ $UPDATE != "y" && $UPDATE != "n" ]]; do
		echo ""
		echo ">" Update Discord Bot Token? \(y/n\)
		read UPDATE
	done
else
	UPDATE="y"
fi


if [[ $UPDATE == "y" ]]; then
	echo ""
	echo ">" What is the Discord Bot Token?
	read DISCORD_BOT_TOKEN

	if [[ "${#DISCORD_BOT_TOKEN}" -gt 0 ]]; then
		echo "${DISCORD_BOT_TOKEN}" > $DISCORD_BOT_TOKEN_PATH
	else
		echo "Invalid input. Skipping."
	fi
fi

DISCORD_DM_CHANNEL_PATH=/var/local/DISCORD_DM_CHANNEL

sudo touch $DISCORD_DM_CHANNEL_PATH

DISCORD_DM_CHANNEL=$(cat $DISCORD_DM_CHANNEL_PATH)

UPDATE=""

if [[ "${#DISCORD_DM_CHANNEL}" -gt 0 ]]; then
	echo ""
	echo "Current Discord DM Channel: ${DISCORD_DM_CHANNEL:0:4}**********"

	while [[ $UPDATE != "y" && $UPDATE != "n" ]]; do
		echo ""
		echo ">" Update Discord DM Channel? \(y/n\)
		read UPDATE
	done
else
	UPDATE="y"
fi


if [[ $UPDATE == "y" ]]; then
	echo ""
	echo ">" What is the Discord DM Channel?
	read DISCORD_DM_CHANNEL

	if [[ "${#DISCORD_DM_CHANNEL}" -gt 0 ]]; then
		echo "${DISCORD_DM_CHANNEL}" > $DISCORD_DM_CHANNEL_PATH
	else
		echo "Invalid input. Skipping."
	fi
fi
