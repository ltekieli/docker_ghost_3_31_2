FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    python \
    unzip \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get update && apt-get install -y \
    nodejs=12* \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace/ghost

RUN curl -sL https://github.com/TryGhost/Ghost/releases/download/3.31.2/Ghost-3.31.2.zip -o /tmp/ghost.zip

RUN unzip /tmp/ghost.zip -d /workspace/ghost

RUN cd /workspace/ghost && npm -s install
