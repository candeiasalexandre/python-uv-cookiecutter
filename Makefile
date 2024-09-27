.PHONY: clean-example-project
clean-example-project:
	@echo "Cleaning example project..."
	@rm -rf example-project

.PHONY: create-example-project
create-example-project: clean-example-project
	@echo "Creating example project..."
	@cookiecutter --no-input . project_name=example-project