FROM xiaocao/mesos

ENV VERSION_CHRONOS 2.5.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends maven node npm git && \
    ln -s /usr/bin/nodejs /usr/bin/node

RUN git clone https://github.com/mesos/chronos.git /chronos

WORKDIR /chronos

RUN mvn clean package && \
    apt-get remove -y --auto-remove maven node npm git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 8080

ENTRYPOINT ["bin/start-chronos.bash"]