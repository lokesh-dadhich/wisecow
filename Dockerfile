FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH so cowsay/fortune can be found
ENV PATH="/usr/games:${PATH}"

WORKDIR /app
COPY wisecow.sh .
RUN chmod +x wisecow.sh

EXPOSE 4499
CMD ["./wisecow.sh"]

