.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; \
	{printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

precommit-install: ## install pre-commit
	@pre-commit install

precommit-run: ## run all pre-commit hooks
	@pre-commit run -a

clean: ## run clean up
	@find . -type d -name '.terraform' | xargs -r rm -r
	@find . -type f -name '*.tfstate*' | xargs -r rm
