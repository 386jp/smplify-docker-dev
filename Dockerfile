FROM python:3.8.6-slim

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        python3-dev \
        python3-setuptools \
        make \
        gcc \
        git

RUN git clone https://github.com/vchoutas/smplify-x.git

WORKDIR /smplify-x

RUN python3 -m pip install -r requirements.txt

RUN apt-get remove -y --purge make gcc build-essential \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/sh", "-c", "while sleep 1000; do :; done"]
