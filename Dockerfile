ARG PORT=1242
FROM justarchi/archisteamfarm:latest
WORKDIR /
# RUN apt-get update && apt-get install -y git python3 python3-pip && \
#     git clone https://github.com/zhongfly/telegram-bot-asf.git  --depth=1 && \
#     cd telegram-bot-asf && \
#     pip3 install -r requirements.txt
# COPY TG/tgbot.toml /telegram-bot-asf/
RUN apt-get update && apt-get install -y tzdata && \
    echo "Asia/Shanghai" > /etc/timezone && \ 
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY ASF/ /app/
COPY entry.sh .
RUN chmod +x entry.sh
EXPOSE ${PORT}
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD [ "./entry.sh" ]
