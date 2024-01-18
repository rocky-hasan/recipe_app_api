FROM python:3.9-alpine3.13

ENV PYTHONBUFFERED 1

COPY ./requirements.txt /temp/requirements.txt

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /temp/requirements.txt && \
    rm -rf /temp && \
    adduser \
        --disabled-password\
        --no-create-home\
        django-user

EXPOSE 8000

ENV PATH="/py/bin:$PATH"
