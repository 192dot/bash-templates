#!/bin/sh

LCKFILE=~/mycronlock.lock
MAX_LOCK_MINUTES=60

# check max age of lock file
test `find $LCKFILE -mmin +$MAX_LOCK_MINUTES` > /dev/null

if [ $? -eq 0 ]
then
  echo "Lock file is older than $MAX_LOCK_MINUTES minutes. Removing it.."
  rm -f $LCKFILE
fi

# create lock file  
lockfile -r 0 $LCKFILE || exit 1

# do stuff here
echo "doing some stuff"

# remove lock in the end
rm -f $LCKFILE
