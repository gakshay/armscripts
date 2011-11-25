#! /bin/sh

sh internet.sh
if [ "$?" == 1 ]; then
  poff tata
  echo "Restarting.."
  pon tata
  echo "Wait..."
  sleep 20
  sh internet.sh
  if [ "$?" == 1 ]; then
    echo "Internet still down.."
    exit 1
  else
    echo "Internet working now"
    exit 0
  fi
fi 
