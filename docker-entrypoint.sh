#!/bin/sh

if [ -z "$(ls -A /var/lib/svn)" ]; then
  echo "No SVN repository found, creating it..."
  svnadmin create /var/lib/svn
  echo "Done"
else
  echo "SVN repository does already exist"
fi

"$@"
