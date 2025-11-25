FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        clang \
        python3 \
        python3-pip \
        make \
        ca-certificates \
        gdb \
        vim-tiny && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY bug.c crash_cond.h collect_state.py synth_assert.py ./

RUN clang -g -O0 bug.c -o bug

CMD ["/bin/bash"]
