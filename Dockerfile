FROM debian:stable
RUN apt-get -y update && apt-get install -y --no-install-recommends ca-certificates openssh-server iptables
RUN mkdir -p --mode=0755 /usr/share/keyrings
#RUN curl -fsSL https://pkgs.tailscale.com/stable/debian/trixie.noarmor.gpg > /usr/share/keyrings/tailscale-archive-keyring.gpg
#RUN curl -fsSL https://pkgs.tailscale.com/stable/debian/trixie.tailscale-keyring.list > /etc/apt/sources.list.d/tailscale.list
COPY tailscale.list /etc/apt/sources.list.d/tailscale.list
COPY tailscale-archive-keyring.gpg /usr/share/keyrings/tailscale-archive-keyring.gpg
COPY tailscale_1.96.4_arm64.deb /tmp
COPY entrypoint.sh /
COPY tailscale-auth-key /
RUN chmod +x entrypoint.sh
#RUN apt-get -y update && apt-get install -y --no-install-recommends tailscale
RUN dpkg -i /tmp/tailscale_1.96.4_arm64.deb
RUN adduser --disabled-password ts
COPY authorized_keys /home/ts/.ssh/
EXPOSE 22
ENTRYPOINT  /entrypoint.sh && \
    bash
