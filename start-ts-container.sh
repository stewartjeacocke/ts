#!/bin/sh
podman run --dns=8.8.8.8 --hostname=tsh --cap-add=NET_ADMIN --device=/dev/net/tun -p 1080:1080 ts