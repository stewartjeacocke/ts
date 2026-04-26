#!/bin/sh
/usr/sbin/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/run/tailscale/tailscaled.sock --port=41641 --socks5-server=:1080 >tailscaled-log 2>&1 &
tailscale up --auth-key file:tailscale-auth-key
tail -f tailscaled-log