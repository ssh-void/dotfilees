#Install Flatpak
doas xbps-install -Syu flatpak
#Add the Flathub repository to Flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#install kdenlive
flatpak --user install flathub org.kde.kdenlive -y
#install Cryptomator
flatpak --user install flathub org.cryptomator.Cryptomator -y
# update
doas flatpak update
#for run use the export $(dbus-launch)
#flatpak run "$(flatpak list --app --columns=application | fzy)" &> /dev/null
