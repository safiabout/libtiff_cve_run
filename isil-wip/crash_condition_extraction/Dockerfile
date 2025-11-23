FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        clang \
        python3 \
        python3-pip \
        make \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy your sources
COPY bug.c crash_cond.h collect_state.py synth_assert.py ./

# Default build step
RUN clang -g -O0 bug.c -o bug

CMD ["/bin/bash"]
