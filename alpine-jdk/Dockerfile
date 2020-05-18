# JVM 在 Docker 等容器环境下的资源限制问题 
# https://blog.yuanbin.me/posts/2019-03/2019-03-18_23-30-06/
# https://segmentfault.com/a/1190000021392583?utm_medium=referral

FROM javachen/alpine:3.11

ENV LANG en_US.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV PATH ${PATH}:${JAVA_HOME}/bin

# Create a user and group used to launch processes
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)
RUN set -x \
	&& apk add --update openjdk8 openjdk8-jre ttf-dejavu fontconfig \
	&& fc-cache -f \
	&& addgroup --gid 1000 java \
	&& adduser --disabled-password --uid 1000 --ingroup java --home /home/java java \
	&& chmod 755 /home/java

WORKDIR /home/java

USER java

CMD ["java", "-version"]