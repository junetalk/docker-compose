#!/bin/bash


DB_LOOPS="20"
MYSQL_HOST="mysql"
MYSQL_PORT="3306"
START_CMD="bin/start-web.sh"

#wait for mysql
i=0
while ! nc $MYSQL_HOST $MYSQL_PORT >/dev/null 2>&1 < /dev/null; do
  i=`expr $i + 1`
  if [ $i -ge $DB_LOOPS ]; then
    echo "$(date) - ${MYSQL_HOST}:${MYSQL_PORT} still not reachable, giving up"
    exit 1
  fi
  echo "$(date) - waiting for ${MYSQL_HOST}:${MYSQL_PORT}..."
  sleep 1
done

# Work around to run container as a daemon
sed -i "s/ &//" $START_CMD

curl -G "executor:12321/executor?action=activate" && echo

# mysql -h mysql -uazkaban -pazkaban -e "update executors set active=1 where host='executor';"

# Work around to run container as a daemon
exec $START_CMD