#!/bin/bash
sh ./clean_mem.sh;
exec gunicorn keep_alive:app --bind 0.0.0.0:8080 &
xvfb-run --server-args="-screen 0 800x600x24" python3 main.py