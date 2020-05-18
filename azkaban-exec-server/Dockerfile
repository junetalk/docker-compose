FROM javachen/alpine-jdk:8

# Azkaban executor port
EXPOSE 12321

COPY azkaban-exec-server-0.1.0-SNAPSHOT.tar.gz .

# coreutils https://www.cnblogs.com/shansongxian/p/10531439.html
RUN  apk add --no-cache git coreutils mysql-client mongodb-tools postgresql-client redis \
    && tar zxf azkaban-exec-server-0.1.0-SNAPSHOT.tar.gz \
    && mv azkaban-exec-server-0.1.0-SNAPSHOT azkaban-exec-server \
    && rm -rf azkaban-exec-server-0.1.0-SNAPSHOT.tar.gz

# Define default workdir
WORKDIR azkaban-exec-server

COPY conf/* conf/
COPY run.sh run.sh
RUN chmod +x run.sh

CMD ./run.sh && tail -f /dev/null