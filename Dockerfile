FROM python:3.6-slim

RUN pip install -U faust
RUN pip install aiocontextvars

ENTRYPOINT ["faust", "-A", "hello_world", "worker", "-l", "info"]

