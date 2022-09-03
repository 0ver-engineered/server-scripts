IP=$(cat /var/local/PUBLIC_IP_ADDRESS)

URL=$(cat /var/local/TELEGRAM_BOT_URL)
CHAT_ID=$(cat /var/local/TELEGRAM_CHAT_ID)

while getopts p: flag
do
	case "${flag}" in
		p) PREFIX=${OPTARG};;
	esac
done

if [[ ${#PREFIX} -gt 0 ]]; then
	TEXT="${PREFIX} // ${IP}"
else
	TEXT="${IP}"
fi

echo "Sending IP Notification: ${TEXT}"

bash /scripts/discord/sendMessage.sh -t "${TEXT}"
bash /scripts/telegram/sendMessage.sh -t "${TEXT}"
