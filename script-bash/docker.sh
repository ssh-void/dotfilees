USERNAME=$(logname)
doas xbps-install -Syu docker nvidia-docker
#doas xbps-install -Syu nvidia-docker
doas ln -s /etc/sv/docker /var/service/
doas usermod -aG docker "$USERNAME"
doas sv status docker
doas docker pull alpine # officelle
#docker pull ubuntu:rolling # officelle
#docker pull debian:trixie-backports # officelle
#docker pull rockylinux:9.3.20231119-minimal # officelle
#docker pull archlinux:multilib-devel-20250914.0.420821 # officelle
#CPU version
#docker pull ghcr.io/idiap/coqui-tts-cpu
#GPU version
docker pull ghcr.io/idiap/coqui-tts
docker pull  rclone/rclone
#doas shutdown -r now
