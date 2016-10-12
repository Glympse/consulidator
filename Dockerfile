FROM python:3-slim
MAINTAINER DJ Enriquez <dj.enriquez@infospace.com>

ENV LOG_LEVEL=INFO \
    APP_DIR=/opt/consulere/

WORKDIR $APP_DIR
COPY ./requirements.txt $APP_DIR

RUN apt-get update \
    && pip install -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

COPY . $APP_DIR

ENTRYPOINT ["./main"]

CMD ["--help"]
