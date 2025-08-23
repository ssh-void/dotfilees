#Install Flatpak : https://flatpak.org/setup/Void%20Linux
doas xbps-install -Syu flatpak
#Add the Flathub repository to Flatpak
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#install kdenlive
flatpak --user install --or-update flathub org.kde.kdenlive -y
#install Cryptomator
flatpak --user install --or-update flathub org.cryptomator.Cryptomator -y
#install FreeTube [The Private YouTube Client]
flatpak --user install --or-update flathub io.freetubeapp.FreeTube
#install brave-Browser
#flatpak --user install --or-update flathub com.brave.Browser
# update
doas flatpak update -y
#for run use the export $(dbus-launch)
#flatpak run "$(flatpak list --app --columns=application | fzy)" &> /dev/null
