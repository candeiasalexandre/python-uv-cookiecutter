.PHONY: clean-env
clean-env:
	-rm -rf .venv


.PHONY: clean-build
clean-build:
	@rm -fr pip-wheel-metadata
	@rm -fr build/
	@rm -fr dist/
	@rm -fr .eggs/
	@find . -name '*.egg-info' -exec rm -fr {} +
	@find . -name '*.egg' -exec rm -f {} +


.PHONY: setup-dev
setup-dev: clean-env
	uv sync


.PHONY: tests
tests:
	uv run pytest tests


.PHONY: format
format:
	uv run ruff check src tests --select I --fix
	uv run ruff format src tests


.PHONY: check
check:
	uv run ruff format src tests --check
	uv run ruff check src tests


.PHONY: build
build: clean-build
	uv build


.PHONY: docker-build
docker-build:
	docker build -t {{cookiecutter.__project_name_kebab}} .

.PHONY: docker-run
docker-run: docker-build
	docker run -it {{cookiecutter.__project_name_kebab}}