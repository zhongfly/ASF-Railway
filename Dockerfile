FROM justarchi/archisteamfarm:released
WORKDIR /
RUN apt-get update && apt-get install -y git python3 python3-pip && \
    git clone https://github.com/zhongfly/telegram-bot-asf.git  --depth=1 && \
    cd telegram-bot-asf && \
    pip3 install -r requirements.txt
COPY TG/tgbot.toml /telegram-bot-asf/
COPY ASF/ /app/
COPY entry.sh .
RUN chmod +x entry.sh
EXPOSE 1242
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD [ "./entry.sh" ]
