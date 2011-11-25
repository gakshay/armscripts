#!/bin/bash
# =========================================================
# Change the following configuration according to your needs
# =========================================================
HOME=/home/root
LOCALEXPORTDIR=$HOME/dakia/files/send
LOCALIMPORTDIR=$HOME/dakia/files/receive

INBOX=$LOCALEXPORTDIR/inbox
OUTBOX=$LOCALEXPORTDIR/outbox
LOGDIR=$LOCALEXPORTDIR/log
PROCDIR=$LOCALEXPORTDIR/processing
CONTROLDIR=$LOCALEXPORTDIR/control
ERRORDIR=$LOCALEXPORTDIR/error
ARCHIVEDIR=$LOCALEXPORTDIR/archive

mkdir -p $INBOX $OUTBOX $LOGDIR $PROCDIR $CONTROLDIR $ERRORDIR $ARCHIVEDIR

LOGDIR=$LOCALIMPORTDIR/log
mkdir -p $LOGDIR
