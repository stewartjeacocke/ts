FROM debian:stable
RUN apt-get -y update && apt-get install -y --no-install-recommends ca-certificates openssh-server
RUN mkdir -p --mode=0755 /usr/share/keyrings
#RUN curl -fsSL https://pkgs.tailscale.com/stable/debian/trixie.noarmor.gpg > /usr/share/keyrings/tailscale-archive-keyring.gpg
#RUN curl -fsSL https://pkgs.tailscale.com/stable/debian/trixie.tailscale-keyring.list > /etc/apt/sources.list.d/tailscale.list
COPY tailscale.list /etc/apt/sources.list.d/tailscale.list
COPY tailscale-archive-keyring.gpg /usr/share/keyrings/tailscale-archive-keyring.gpg
RUN apt-get -y update && apt-get install -y --no-install-recommends tailscale
EXPOSE 22
ENTRYPOINT service ssh start && bash
