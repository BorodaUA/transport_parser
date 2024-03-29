FROM python:3.9.6-alpine3.13
#
RUN mkdir /usr/src/app/
WORKDIR /usr/src/app/
#
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
#
RUN apk update
RUN apk add --no-cache \
git \
postgresql-dev \
gcc \
python3-dev \
musl-dev \
libressl-dev \
libffi-dev \
zeromq-dev \
libxml2-dev \
libxslt-dev \
g++ \
unzip \
rust \
cargo
#
COPY . /usr/src/app/
#
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
#
ENTRYPOINT ["sh", "entrypoint.sh"]