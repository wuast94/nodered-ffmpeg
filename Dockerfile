# Use a specific version of the Node-RED base image
FROM nodered/node-red:3.1.9

# Install FFmpeg
USER root
RUN apk update && apk add --no-cache ffmpeg
USER node-red