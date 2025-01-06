PHONY: install run virtualenv ipython clean test pflake8 fmt lint


install:
	@echo "Installing for dev environment"
	@.venv/bin/python -m pip install -e '.[test,dev]'

virtualenv:
	@python -m venv .venv

run:
	@python app/app.py --debug run

ipython:
	@.venv/bin/ipython

lint:
	@.venv/bin/pflake8 app tests

.PHONY: test

test:
	@echo "Starting Flask server in background..."
	@python app/app.py --debug run &
	@echo "Waiting for server to start..."
	@sleep 5 
	@python tests/test_index.py
	@echo "Tests completed!"


fmt:
	@.venv/bin/isort --profile=black -m 3 app tests
	@.venv/bin/black app tests

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
