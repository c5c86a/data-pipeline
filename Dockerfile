FROM python:3.6-slim

RUN pip install -U faust
RUN pip install aiocontextvars
ADD hello_world.py

ENTRYPOINT ["faust", "-A", "hello_world", "worker", "-l", "info"]

