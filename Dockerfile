FROM public.ecr.aws/docker/library/python:3.11-slim

COPY Pipfile* .
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc libc6-dev libcups2-dev && \
    rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip pipenv
RUN pipenv install --system
RUN groupadd -g 10001 app && \
    useradd -r -u 10001 -g app app
USER app
