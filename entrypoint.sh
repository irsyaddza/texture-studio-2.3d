#!/bin/bash
set -e

# Pastikan folder logs dan file log ada
mkdir -p /tstudio/logs
touch /tstudio/logs/server_log.txt

# Stream server_log.txt ke stdout agar docker compose logs bisa menampilkan log secara live
tail -n 0 -F /tstudio/logs/server_log.txt &

# Jalankan server SA-MP
exec ./samp03svr
