################################################################################
# GLOBALS                                                                      #
################################################################################

PACKAGE_NAME = pyjarowinkler
PYTHON = py
MYPY_CACHE = .mypy_cache
PYTEST_CACHE = .pytest_cache
DIST = dist

EGG_INFO = $(PACKAGE_NAME)_stubs.egg-info

################################################################################
# Self Documenting Commands                                                    #
################################################################################

help:
	@echo "Available commands to use:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-s:\033[0m %s\n", $$1, $$2}'


################################################################################
# COMMANDS                                                                     #
################################################################################

clean: ## Delete all compiled python files
	@echo ">>> Cleaning"
	find . -type f -name "*.py[co]" -delete
	find . -type d -name "__pycache__" -delete
	if [ -d "${MYPY_CACHE}" ]; then rm -r ${MYPY_CACHE}; fi
	if [ -d "${PYTEST_CACHE}" ]; then rm -r ${PYTEST_CACHE}; fi
	if [ -d "${EGG_INFO}" ]; then rm -r ${EGG_INFO}; fi
	if [ -d "${DIST}" ]; then rm -r ${DIST}; fi

lint: ## Lint using flake8
	@echo ">>> Linting python files"
	flake8 src

sort: ## Sort imports using isort
	@echo ">>> Sorting python imports"
	isort .

format: sort ## Format using autopep8
	@echo ">>> Formatting python files"
	autopep8 --in-place --recursive .

mypy: ## Type checking python files
	@echo ">>> Type checking python files"
	mypy .

build: ## Build package
	@echo ">>> Building package"
	${PYTHON} -m build
