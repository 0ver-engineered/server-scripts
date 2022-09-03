URL=$(cat /var/local/TELEGRAM_BOT_URL)
CHAT_ID=$(cat /var/local/TELEGRAM_CHAT_ID)

while getopts t: flag
do
	case "${flag}" in
		t) TEXT=${OPTARG};;
	esac
done

if [[ ${#TEXT} -lt 1 ]]; then
	echo "Invalid text for message."
	exit 0
fi

echo "Sending Telegram Message: ${TEXT}"

curl --request GET \
	--data-urlencode chat_id="${CHAT_ID}" \
	--data-urlencode text="${TEXT}" \
	"$URL/sendMessage"
