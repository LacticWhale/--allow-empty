FROM mcr.microsoft.com/dotnet/nightly/sdk:7.0-alpine3.17-amd64 as builder
WORKDIR /opt/app
RUN apk add --no-cache --update git
RUN git clone https://github.com/space-wizards/SS14.Watchdog.git
RUN cd SS14.Watchdog && dotnet publish -c Release -r linux-x64 --no-self-contained
RUN chmod +x SS14.Watchdog/SS14.Watchdog/bin/Release/net6.0/linux-x64/publish/SS14.Watchdog

FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine
RUN adduser --disabled-password --home /home/container container
USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
EXPOSE 1212
EXPOSE 5000
EXPOSE 5001

COPY --from=builder /opt/app/SS14.Watchdog/SS14.Watchdog/bin/Release/net6.0/linux-x64/publish/* /home/container/
COPY ./appsettings.yml /home/container/

CMD [ "dotnet", "SS14.Watchdog.dll" ]
