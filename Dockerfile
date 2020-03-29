FROM python:3.6-alpine

RUN adduser -D microblog

WORKDIR /home/microblog

COPY src/requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn pymysql

COPY src/app app
COPY src/migrations migrations
COPY src/microblog.py src/config.py src/boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP microblog.py

RUN chown -R microblog:microblog ./
USER microblog

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
