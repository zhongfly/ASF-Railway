cd /telegram-bot-asf
nohup python3 telegram-asf.py tgbot.toml > /dev/null 2>&1 &
cd -
bash /app/ArchiSteamFarm.sh --process-required --service