#!/bin/sh
echo "Starting Clean Mem..."
pkill -9 chromium
pkill -9 node
pkill -9 nodejs
echo "Finished Cleaning Mem..."
