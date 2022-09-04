ID=$(cat /var/local/TELEGRAM_BOT_ID)
PASSWORD=$(cat /var/local/TELEGRAM_BOT_PASSWORD)
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
	"https://api.telegram.org/bot${ID}:${PASSWORD}/sendDocument?chat_id=${CHAT_ID}"

