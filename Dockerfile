FROM python:3.12.4-slim

RUN apt-get update && apt-get install -y \
    curl \
    gcc \
    libpq-dev \
    && apt-get clean

RUN curl -sSL https://install.python-poetry.org | python3 - && \
    ln -s /root/.local/bin/poetry /usr/local/bin/poetry

ENV POETRY_HOME="/root/.local"
ENV PATH="$POETRY_HOME/bin:$PATH"

WORKDIR /app

COPY pyproject.toml poetry.lock ./
RUN poetry install --no-root

COPY . .

WORKDIR /app/crm_django_project

EXPOSE 8000
