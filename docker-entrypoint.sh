#!/bin/sh

if [ -z "$(ls -A /var/lib/svn)" ]; then
  echo "No SVN repository found, creating it..."
  svnadmin create /var/lib/svn
  rm -rf /var/lib/svn/conf/authz /var/lib/svn/conf/passwd
  ln -s /etc/svn/authz /var/lib/svn/conf/authz
  ln -s /etc/svn/passwd /var/lib/svn/conf/passwd
  echo "Done"
else
  echo "SVN repository does already exist"
fi

echo "Running apache: '$@'"
"$@"
