FROM javachen/alpine-jdk:8

# Azkaban web server port
EXPOSE 8443    

COPY azkaban-web-server-0.1.0-SNAPSHOT.tar.gz .

RUN set -eux \
    && tar zxf azkaban-web-server-0.1.0-SNAPSHOT.tar.gz \
    && mv azkaban-web-server-0.1.0-SNAPSHOT azkaban-web-server \
    && rm -rf azkaban-web-server-0.1.0-SNAPSHOT.tar.gz

# Define default workdir
WORKDIR azkaban-web-server

COPY conf/* conf/
COPY run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh && tail -f /dev/null
