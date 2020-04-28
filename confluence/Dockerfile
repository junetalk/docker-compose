FROM  atlassian/confluence-server:7.3.3

COPY "atlassian-agent.jar" /opt/atlassian/confluence/

RUN echo 'export CATALINA_OPTS="-javaagent:/opt/atlassian/confluence/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/confluence/bin/setenv.sh 
