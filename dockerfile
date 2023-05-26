FROM steamcmd/steamcmd as steamcmd
RUN steamcmd +login anonymous +app_update 298740 +quit

FROM devidian/spaceengineers:latest
COPY --from=steamcmd /root/Steam/steamapps/common/SpaceEngineersDedicatedServer/ /
COPY ./world/ /data
EXPOSE 27016/udp 1973

WORKDIR /
ENTRYPOINT wine /DedicatedServer64/SpaceEngineersDedicated.exe -console -path Z:\data