.PHONY: build dev upload lint test clean

README.md: README.m.md
	markup README.m.md -o README.md

build: README.md
	python setup.py build

dev:
	python setup.py develop

upload: readme.md
	python setup.py sdist upload

lint:
	flake8 --show-source MarkdownPP

test: lint
	markup readme.m.md -o readme.test && diff -u readme.md readme.test
	rm -f readme.test
	cd test/ && python test.py

clean:
	rm -rf build dist README MANIFEST MarkdownPP.egg-info
