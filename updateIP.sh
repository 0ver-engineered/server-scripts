IP_PATH=/var/local/PUBLIC_IP_ADDRESS

IP_ERROR_PATH="/var/local/ERROR__PUBLIC_IP_ADDRESS-$(date +%s)"
ERROR_MSG="ERROR // Invalid response for updated IP Address"

# Ensure file exists
touch $IP_PATH

PREVIOUS_IP=$(cat $IP_PATH)

CURRENT_IP=$(curl ipinfo.io/ip)

# Notify if response does not look like an IP Address
if [[ ${#CURRENT_IP} -lt 7 || ${#CURRENT_IP} -gt 15 ]]; then
	# Send Notification
	bash /scripts/discord/sendMessage.sh -t "${ERROR_MSG}"
	bash /scripts/telegram/sendMessage.sh -t "${ERROR_MSG}"

	# Write Error
	echo "${CURRENT_IP}" > $IP_ERROR_PATH

	# Send Error Log
	bash /scripts/telegram/sendDocument.sh -d $IP_ERROR_PATH

# Change locally stored IP and send notification
elif [[ "$PREVIOUS_IP" != "$CURRENT_IP" ]]; then
	echo "${CURRENT_IP}" > $IP_PATH
	bash /scripts/sendIP.sh
fi
