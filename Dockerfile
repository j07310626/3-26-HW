# Dockerfile
FROM python:3.15.0a7-slim
MAINTAINER j07310626@gmail.com
ARG ROOT_DIR=/app
ENV ROOT=${ROOT_DIR} \
    PYTHONENCODING=utf-8
COPY requirements.txt ${ROOT_DIR}/requirements.txt
RUN pip3 install -r requirements.txt
RUN mkdir -p "${ROOT_DIR}/src/static/config" && \
    mkdir -p "${ROOT_DIR}/src/static/data"
COPY src/*.py ${ROOT_DIR}/src/
WORKDIR /app
CMD python3 src/app.py