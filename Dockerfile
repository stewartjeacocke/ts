FROM debian:stable
RUN apt-get -y update && apt-get install -y --no-install-recommends ca-certificates iptables
RUN mkdir -p --mode=0755 /usr/share/keyrings
COPY tailscale.list /etc/apt/sources.list.d/tailscale.list
COPY tailscale-archive-keyring.gpg /usr/share/keyrings/tailscale-archive-keyring.gpg
COPY tailscale_1.96.4_arm64.deb /tmp
COPY entrypoint.sh /
COPY tailscale-auth-key /
RUN chmod +x entrypoint.sh
RUN dpkg -i /tmp/tailscale_1.96.4_arm64.deb
EXPOSE 1080
ENTRYPOINT  ["/entrypoint.sh"] 
