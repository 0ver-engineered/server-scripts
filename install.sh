if test -d "/scripts"; then
	echo "Scripts are already linked."
else
	echo "Linking scripts."
	sudo ln -s ~/server-scripts /scripts
fi

# Discord
bash /scripts/discord/install.sh

# Telegram
bash /scripts/telegram/install.sh
