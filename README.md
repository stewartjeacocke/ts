`podman build -t ts .`
`podman run -it --rm --dns=8.8.8.8 --hostname=tsh --cap-add=NET_ADMIN --device=/dev/net/tun -p 2022:22 ts`
`/usr/sbin/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/run/tailscale/tailscaled.sock --port=41641 >tailscaled-log 2>&1 & `


