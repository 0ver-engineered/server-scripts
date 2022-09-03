CHANNEL=$(cat /var/local/DISCORD_DM_CHANNEL)
TOKEN=$(cat /var/local/DISCORD_BOT_TOKEN)

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

echo "Sending Discord Message: ${TEXT}"

curl --request POST \
	--data-urlencode content="${TEXT}" \
	-H "Authorization: Bot ${TOKEN}" \
	"https://discord.com/api/v10/channels/${CHANNEL}/messages"
