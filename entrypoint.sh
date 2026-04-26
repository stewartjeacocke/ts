#!/bin/sh
/usr/sbin/tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/run/tailscale/tailscaled.sock --port=41641 >tailscaled-log 2>&1 &
tailscale up --auth-key file:tailscale-auth-key
service ssh start