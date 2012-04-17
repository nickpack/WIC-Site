#!/bin/bash
  set -e
  LOGFILE=/home/walkincoma/logs/gunicorn.log
  LOGDIR=$(dirname $LOGFILE)
  NUM_WORKERS=3
  source venv/bin/activate
  test -d $LOGDIR || mkdir -p $LOGDIR
  exec python manage.py run_gunicorn -b "0.0.0.0:8000" -w $NUM_WORKERS --log-level=debug --log-file=$LOGFILE 2>>$LOGFILE