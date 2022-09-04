CHANNEL=$(cat /var/local/DISCORD_DM_CHANNEL)
TOKEN=$(cat /var/local/DISCORD_BOT_TOKEN)

while getopts "t:f:" flag
do
	case "${flag}" in
		f) FILE=${OPTARG};;
		t) TEXT=${OPTARG};;
	esac
done

if [[ ${#TEXT} -lt 1 && ${#FILE} -lt 1 ]]; then
	echo "Invalid content for message. Needs either text or a file."
	exit 0
fi

echo "Sending Discord Message: ${TEXT}"

if [[ "${#TEXT}" -gt 0 && "${#FILE}" -gt 0 ]]; then
	#	--data-urlencode content="${TEXT}" \
	curl --request POST \
		-H "Authorization: Bot ${TOKEN}" \
		-F content="${TEXT}" \
		-F file=@"${FILE}" \
		"https://discord.com/api/v10/channels/${CHANNEL}/messages"
elif [[ "${#FILE}" -gt 0 ]]; then
	curl --request POST \
		-H "Authorization: Bot ${TOKEN}" \
		-F file=@"${FILE}" \
		"https://discord.com/api/v10/channels/${CHANNEL}/messages"
else
	curl --request POST \
		-H "Authorization: Bot ${TOKEN}" \
		-F content="${TEXT}" \
		"https://discord.com/api/v10/channels/${CHANNEL}/messages"
fi
