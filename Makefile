PHONY: install run virtualenv ipython clean test pflake8 fmt lint


install:
	@echo "Installing for dev environment"
	@.venv/bin/python -m pip install -e '.[test,dev]'


virtualenv:
	@python -m venv .venv


run:
	@python app/app.py --debug

ipython:
	@.venv/bin/ipython


lint:
	@.venv/bin/pflake8

fmt:
	@.venv/bin/isort --profile=black -m 3 app
	@.venv/bin/black app

clean:            ## Clean unused files.
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	@rm -rf .cache
	@rm -rf .pytest_cache
	@rm -rf .mypy_cache
	@rm -rf build
	@rm -rf dist
	@rm -rf *.egg-info
	@rm -rf htmlcov
	@rm -rf .tox/
	@rm -rf docs/_build
