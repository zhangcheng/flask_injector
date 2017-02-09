SOURCES := flask_injector.py flask_injector_tests.py

.PHONY: test
test: mypy
	nosetests -v $(SOURCES)
	PYTHONPATH=.:$(PYTHONPATH) python example.py
	flake8 --max-line-length=110 $(SOURCES)

.PHONY: mypy
mypy:
	python -m mypy \
		--silent-imports \
		--disallow-untyped-defs \
		--warn-no-return \
		--warn-redundant-casts \
		--strict-optional \
		--fast-parser \
		flask_injector.py
