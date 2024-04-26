# Use a specific version of the Node-RED base image
FROM nodered/node-red:3.1.9

# Switch to root to install additional packages
USER root

# Update apk and install ffmpeg and Python
RUN apk update && apk add --no-cache ffmpeg python3 py3-pip

# Install streamlink using pip
RUN pip3 install streamlink

# Switch back to the node-red user
USER node-red