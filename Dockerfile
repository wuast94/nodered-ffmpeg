# Use a specific version of the Node-RED base image
FROM nodered/node-red:4.0.8

# Switch to root to install additional packages
USER root

# Update apk and install ffmpeg, Python, and necessary development libraries
RUN apk update && apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    libxml2-dev \
    libxslt-dev \
    build-base \
    python3-dev \
    py3-lxml \
    py3-pycryptodome \
    pipx \
    yt-dlp


# Switch back to the node-red user
USER node-red

# Install streamlink using pipx and ensure it is globally accessible
RUN pipx install streamlink
RUN pipx ensurepath

# Ensure the node-red user has the correct PATH
ENV PATH="/usr/local/bin:${PATH}"
