#!/bin/bash

# const
LDAP_SERVER_IP="192.168.1.121"
LDAP_SERVER_PORT="30389"
LDAP_ADMIN_USER="cn=admin,dc=wesine,dc=com"
LDAP_ADMIN_PASS="admin"

if [ x"$#" != x"3" ];then
    echo "Usage: $0 <username> <realname>"
    exit -1
fi

# param
USER_ID="$1"
SN="$2"
NAME="$3"
PASSWORD="wesine027"
ENCRYPT_PASSWORD=$(slappasswd -h {ssha} -s "$PASSWORD")

# add count & group 
cat <<EOF | ldapmodify -c -h $LDAP_SERVER_IP -p $LDAP_SERVER_PORT \
    -w $LDAP_ADMIN_PASS -D $LDAP_ADMIN_USER 
dn: cn=$USER_ID,ou=People,dc=wesine,dc=com
changetype: add
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetOrgPerson
cn: $USER_ID
sn: $SN
givenName: $NAME
displayName: $SN$NAME
mail: $USER_ID@wesine.com
userPassword: $ENCRYPT_PASSWORD

dn: cn=jira,ou=Group,dc=wesine,dc=com
changetype: modify
add: uniqueMember
uniqueMember: cn=$USER_ID,ou=People,dc=wesine,dc=com
EOF
