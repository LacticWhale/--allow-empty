FROM amd64/alpine:3.17

RUN apk add --no-cache --update git dotnet7-sdk aspnetcore6-runtime gcompat python3
RUN ln -s python3 /bin/python
RUN adduser --disabled-password --home /home/container container
USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
EXPOSE 1212
EXPOSE 5000
EXPOSE 5001

COPY ./files* /home/container/

# CMD [ "./SS14.Watchdog" ]