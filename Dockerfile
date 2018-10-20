FROM python:2.7

RUN pip install awscli && \
    apt update && \
    apt install -y jq

COPY ./entrypoint.sh /entrypoint.sh

ENV LOCAL_PATH ""
ENV S3_PATH ""
ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""
ENV CHOWN 0
ENV USER_ID 1000

ENTRYPOINT ["/entrypoint.sh"]
