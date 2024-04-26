# Use a specific version of the Node-RED base image
FROM nodered/node-red:3.1.9

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
    python3-lxml

# Install streamlink using pip
RUN pip3 install streamlink

# Switch back to the node-red user
USER node-red