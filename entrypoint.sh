#!/bin/bash


export DISPLAY=:99
export DBUS_SESSION_BUS_ADDRESS=/dev/null

# start vxfb
Xvfb :99 -screen 0 1280x800x8 -nolisten tcp &

# start the script

exec python3 alive.py