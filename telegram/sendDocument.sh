URL=$(cat /var/local/TELEGRAM_BOT_URL)
CHAT_ID=$(cat /var/local/TELEGRAM_CHAT_ID)

while getopts d: flag
do
	case "${flag}" in
		d) DOCUMENT=${OPTARG};;
	esac
done

if [[ ${#DOCUMENT} -lt 1 ]]; then
	echo "Invalid file for message."
	exit 0
fi

curl \
	-F document=@"${DOCUMENT}" \
	"$URL/sendDocument?chat_id=${CHAT_ID}"

