cd ~
git clone https://github.com/space-wizards/SS14.Watchdog.git
cd SS14.Watchdog
dotnet publish -c Release -r linux-x64 --no-self-contained
cd ~
mkdir build
COPY /SS14.Watchdog/SS14.Watchdog/bin/Release/net6.0/linux-x64/publish/* /home/container/build
