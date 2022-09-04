# Telegram
TELEGRAM_BOT_ID_PATH=/var/local/TELEGRAM_BOT_ID

sudo touch $TELEGRAM_BOT_ID_PATH

TELEGRAM_BOT_ID=$(cat $TELEGRAM_BOT_ID_PATH)

UPDATE=""

if [[ "${#TELEGRAM_BOT_ID}" -gt 0 ]]; then
	echo ""
	echo "Current Telegram Bot ID: ${TELEGRAM_BOT_ID:0:4}**********"

	while [[ $UPDATE != "y" && $UPDATE != "n" ]]; do
		echo ""
		echo ">" Update Telegram Bot Id? \(y/n\)
		read UPDATE
	done
else
	UPDATE="y"
fi


if [[ $UPDATE == "y" ]]; then
	echo ""
	echo ">" What is the Telegram Bot Id?
	read TELEGRAM_BOT_ID

	if [[ "${#TELEGRAM_BOT_ID}" -gt 0 ]]; then
		echo "${TELEGRAM_BOT_ID}" > $TELEGRAM_BOT_ID_PATH
	else
		echo "Invalid input. Skipping."
	fi
fi

TELEGRAM_BOT_PASSWORD_PATH=/var/local/TELEGRAM_BOT_PASSWORD

sudo touch $TELEGRAM_BOT_PASSWORD_PATH

TELEGRAM_BOT_PASSWORD=$(cat $TELEGRAM_BOT_PASSWORD_PATH)

UPDATE=""

if [[ "${#TELEGRAM_BOT_PASSWORD}" -gt 0 ]]; then
	echo ""
	echo "Current Telegram Bot Password: ${TELEGRAM_BOT_PASSWORD:0:4}**********"

	while [[ $UPDATE != "y" && $UPDATE != "n" ]]; do
		echo ""
		echo ">" Update Telegram Bot Password? \(y/n\)
		read UPDATE
	done
else
	UPDATE="y"
fi


if [[ $UPDATE == "y" ]]; then
	echo ""
	echo ">" What is the Telegram Bot PASSWORD?
	read TELEGRAM_BOT_PASSWORD

	if [[ "${#TELEGRAM_BOT_PASSWORD}" -gt 0 ]]; then
		echo "${TELEGRAM_BOT_PASSWORD}" > $TELEGRAM_BOT_PASSWORD_PATH
	else
		echo "Invalid input. Skipping."
	fi
fi

TELEGRAM_CHAT_ID_PATH=/var/local/TELEGRAM_CHAT_ID

sudo touch $TELEGRAM_CHAT_ID_PATH

TELEGRAM_CHAT_ID=$(cat $TELEGRAM_CHAT_ID_PATH)

UPDATE=""

if [[ "${#TELEGRAM_CHAT_ID}" -gt 0 ]]; then
	echo ""
	echo "Current Telegram Chat Id: ${TELEGRAM_CHAT_ID:0:4}**********"

	while [[ $UPDATE != "y" && $UPDATE != "n" ]]; do
		echo ""
		echo ">" Update Telegram CHAT Id? \(y/n\)
		read UPDATE
	done
else
	UPDATE="y"
fi


if [[ $UPDATE == "y" ]]; then
	echo ""
	echo ">" What is the Telegram Chat Id?
	read TELEGRAM_CHAT_ID

	if [[ "${#TELEGRAM_CHAT_ID}" -gt 0 ]]; then
		echo "${TELEGRAM_CHAT_ID}" > $TELEGRAM_CHAT_ID_PATH
	else
		echo "Invalid input. Skipping."
	fi
fi
