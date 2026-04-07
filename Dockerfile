FROM dhi.io/alpine-base:3.23-dev
# dhi is docker hardened image for alpine for arm64 only

# for 32 bit (raspberry pi zero, 1, 2) comment out the above FROM and uncomment this one
#FROM alpine

ARG BUILD_DATE

### About this container
LABEL build_info="danmogger/gps-chrony build-date:- ${BUILD_DATE}"
LABEL maintainer="danmogger <danmogger@gmail.com>"
LABEL documentation="https://github.com/danmogger/gps-chrony"

### Installs
RUN apk add --no-cache chrony gpsd gpsd-clients

### Ports
EXPOSE 123/udp

### NTP startup script
COPY start.sh /root/start.sh
COPY gpsd /etc/default/gpsd
COPY chrony.conf /etc/chrony/chrony.conf

# make start script executable
RUN chmod +x /root/start.sh

### Monitor NTP process
HEALTHCHECK CMD chronyc sources || exit 1

### Start script
ENTRYPOINT ["sh", "-c", "/root/start.sh"]
#CMD ["/root/start.sh"]
#ENTRYPOINT ["sleep", "infinity"
