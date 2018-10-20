# Backup retriever

NOTE: Originally created by AlexDouze (https://github.com/AlexDouze)

This Docker image is designed to be used as an init container for
another container in a Kubernetes pod. It will untar a backup archive
from a S3 bucket in the specified path.

To tune this image several environment variables can be overridden:

```
LOCAL_PATH: The path to the directory in which the backup will be untarred.
S3_PATH: The S3 path to the backup (e.g: "s3://backup/backup.tgz")
```

You need to mount the directory in which to untar your backup to in /backup (or elsewhere, but override the PATH_TO_BACKUP: env var).
You also need to mount aws credentials with permission to write in your S3_PATH bucket in /root/.aws or via environment variables.

Example:

```
docker run -it --rm -v $HOME/.aws:/root/.aws -v to_restore_directory:/backup -e S3_PATH="s3://my-s3-bucket/backup.tgz" -e LOCAL_PATH=/directory_to_untar_into backup-retriever:1.0
```
