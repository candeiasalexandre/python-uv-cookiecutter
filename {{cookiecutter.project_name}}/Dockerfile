##
## Base
FROM python:{{cookiecutter.python_version}}-slim AS base

##
## Build
FROM base AS build
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

WORKDIR /app

ADD pyproject.toml /app
ADD uv.lock /app
ADD src/ /app

RUN --mount=type=cache,target=/root/.cache/uv \
    uv build

##
## Runtime
FROM base AS runtime

WORKDIR /app

COPY --from=build --chown=app:app /app/dist/{{cookiecutter.__project_name_kebab}}-*.whl .

RUN --mount=from=ghcr.io/astral-sh/uv,source=/uv,target=/bin/uv \
    --mount=type=cache,target=/root/.cache/uv \
    uv pip install --system {{cookiecutter.__project_name_kebab}}-*.whl

RUN rm {{cookiecutter.__project_name_kebab}}-*.whl
  
CMD ["{{cookiecutter.__project_name_kebab}}"]