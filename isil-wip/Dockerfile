FROM aflplusplus/aflplusplus:latest

RUN apt-get update && apt-get install -y \
    gdb \
    inotify-tools \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY target.c .
COPY harness.c .

RUN clang -g -O0 target.c -o target
RUN clang -g -O0 harness.c -o harness

RUN mkdir -p /work/in /work/out
RUN echo "seed" > /work/in/seed

ENTRYPOINT ["/bin/bash"]
