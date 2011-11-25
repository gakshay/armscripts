#!/bin/bash

# Check the credentials here first before running the script
PROJECTDIR='/home/root/dakia'
LOCALEXPORTDIR='/home/root/dakia/files/send'
OUTBOX=$LOCALEXPORTDIR/outbox
INBOX=$LOCALEXPORTDIR/inbox
LOGDIR=$LOCALEXPORTDIR/log
PROCDIR=$LOCALEXPORTDIR/processing
CONTROLDIR=$LOCALEXPORTDIR/control
ERRORDIR=$LOCALEXPORTDIR/error
ARCHIVEDIR=$LOCALEXPORTDIR/archive
mkdir -p $INBOX $OUTBOX $LOGDIR $PROCDIR $CONTROLDIR $ERRORDIR $ARCHIVEDIR

# ========================================================
# PROGRAM start
# ========================================================

# Helper functions to maintain log entries in the project
check_error() {
    if [ "${1}" -ne "0" ]; then
        echo "Export Error:`date +"%d-%m-%y:%T"`: $1"
    return 1
    fi  
  return 0
}

log_entry(){
  echo "Export $2:`date +"%d-%m-%y:%T"` :$1" 
}

file_exists(){
  for file in $1/*.txt
  do  
    if [ -f "$file" ]; then
      return 0
    fi  
    return 1
  done
}

dir_exists(){
  test -d $1/*
  echo $?
}

# ========================================================
# 1. moving inbox files to outbox
# ========================================================
dir_exists $INBOX
check_error $? "No files to send to server"
ret_val=$?
if [ "$ret_val" -ne "1" ]; then
  log_entry "moving files to outbox for processing" INFO
  cp -r $INBOX/* $OUTBOX/
  rm -r $INBOX/*
fi


# ========================================================
# 2 export files to NFS if any
# ========================================================
dir_exists $OUTBOX
check_error $? "Nothing to export to eDakia Cloud"
ret_val=$?
if [ "$ret_val" -ne "1" ]; then
  log_entry "Files Export to eDakia server" INFO
  sh $PROJECTDIR/scripts/transfer_send.sh
  check_error $? "Files export to eDakia Cloud failed, files moved to $ERRORDIR" ERROR
fi

