#cd /telegram-bot-asf
#nohup python3 telegram-asf.py tgbot.toml > /dev/null 2>&1 &
#cd -
bash /app/ArchiSteamFarm.sh --cryptkey 125513 --process-required --service || bash /app/ArchiSteamFarm-Service.sh  --cryptkey 125513 --process-required --service
