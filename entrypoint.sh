#!/bin/bash
set -e

if [ ! -d "$LOCAL_PATH" ]; then
  echo "Create $LOCAL_PATH directory"
  mkdir -p "$LOCAL_PATH"
fi

if [ "$CHOWN" = "1" ]; then
  echo "Chown $LOCAL_PATH to user $USER_ID"
  chown "$USER_ID":"$USER_ID" "$LOCAL_PATH"
fi

if [ ! -f "$LOCAL_PATH/retrieved.tgz" ]; then
  echo "Retreiving $S3_PATH"
  aws s3 cp "$S3_PATH" "$LOCAL_PATH/retrieved.tgz"
  tar xvzf "$LOCAL_PATH/retrieved.tgz" -C "$LOCAL_PATH"
fi

if [ "$CHOWN" = "1" ]; then
  echo "Chown recursive $LOCAL_PATH to user $USER_ID"
  chown -R "$USER_ID":"$USER_ID" "$LOCAL_PATH"
fi
