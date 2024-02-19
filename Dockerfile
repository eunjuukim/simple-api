FROM python:3.10.9
LABEL authors="qraft_eunjukim"

WORKDIR /root/simple-api
COPY . /root/simple-api

RUN curl -sSL https://install.python-poetry.org | POETRY_VERSION=1.7.1 python3.10 -
ENV PATH="/root/.local/share/pypoetry/venv/bin:$PATH"
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

ENV PYTHONPATH=/root/.local/share/pypoetry/venv/lib/python3.10/site-packages:/root/simple-api

EXPOSE 5050

RUN echo "health check" > /tmp/healthy

CMD uvicorn app.main:app --host 0.0.0.0 --port 5050