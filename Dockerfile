FROM ruby:2.7.3-slim-buster
RUN set -eux; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
		wget \
		lsb-release \
                gnupg2 \
		build-essential \
                git \
                libsqlite3-dev \
                libpq-dev
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee  /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN set -eux; \
        apt-get update; \
        apt-get install -y --no-install-recommends \
		postgresql-client-common \
		postgresql-12 \
		postgresql-client-12
ADD idle.sh /root
CMD cd; ./idle.sh


