.PHONY: clean-example-project
clean-example-project:
	@echo "Cleaning example project..."
	@rm -rf example-project

.PHONY: create-example-project
create-example-project: clean-example-project
	@echo "Creating example project..."
	@cookiecutter --no-input . project_name=example-project

.PHONY: test-example-project
test-example-project: create-example-project
	@echo "Testing example project..."
	@cd example-project && make setup-dev && make docker-run