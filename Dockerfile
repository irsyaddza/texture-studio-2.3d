FROM ubuntu:24.04

LABEL maintainer="Texture Studio 2.3d"
LABEL description="San Andreas Multiplayer Linux Server"

ENV DEBIAN_FRONTEND=noninteractive

# ── Install dependensi sistem ────────────────────────────────────────────────
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
        wget \
        curl \
        netcat-openbsd \
        procps \
        tar \
        libc6:i386 \
        libstdc++6:i386 \
        libssl3:i386 \
        zlib1g:i386 \
        libatomic1:i386 \
        dos2unix \
        tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O /tmp/libmysqlclient18.deb http://launchpadlibrarian.net/247514894/libmysqlclient18_5.6.28-1ubuntu3_i386.deb && \
    dpkg -x /tmp/libmysqlclient18.deb /tmp/libmysqlclient18 && \
    cp -r /tmp/libmysqlclient18/usr/lib/i386-linux-gnu/* /usr/lib/i386-linux-gnu/ && \
    rm -rf /tmp/libmysqlclient18* /tmp/libmysqlclient18.deb && \
    ldconfig

# ── Buat folder kerja ────────────────────────────────────────────────────────
RUN mkdir -p /tstudio
WORKDIR /tstudio

# ── Copy samp Server binary & config ───────────────────────────────────────
COPY samp03svr           ./samp03svr
RUN chmod +x ./samp03svr
COPY server.cfg          ./server.cfg

# ── Copy plugin .so (Linux) — harus cocok dgn "plugins" di server.cfg ───────
COPY plugins/streamer.so            ./plugins/streamer.so
COPY plugins/sscanf.so              ./plugins/sscanf.so
COPY plugins/crashdetect.so         ./plugins/crashdetect.so
COPY plugins/filemanager.so         ./plugins/filemanager.so
COPY plugins/jit.so                 ./plugins/jit.so

# ── Copy gamemode, filterscripts, scriptfiles, models ───────────────────────
COPY gamemodes/     ./gamemodes/
COPY filterscripts/ ./filterscripts/
COPY scriptfiles/   ./scriptfiles/
COPY models/        ./models/

# ── Folder log persisten (mount: samp_logs -> /tstudio/logs) ────────────────
RUN mkdir -p /tstudio/logs && \
    ln -sf /tstudio/logs/server_log.txt  /tstudio/server_log.txt && \
    ln -sf /tstudio/logs/crashdetect.log /tstudio/crashdetect.log

EXPOSE 7779/udp
EXPOSE 7779/tcp

STOPSIGNAL SIGINT

CMD ["./samp03svr"]