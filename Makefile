.DEFAULT_GOAL := all
.PHONY: all docker-build install start build-js build watch-js watch

all: install build start

docker-build:
	docker-compose build

install: docker-build
	docker-compose run web npm install --save body-parser express lodash.find pug pg babel-cli react react-dom react-redux redux redux-thunk promise-polyfill whatwg-fetch
	docker-compose run web npm install --save-dev nodemon babel-preset-env babel-preset-es2015 babel-preset-react redux-devtools babelify browserify watchify

start:
	docker-compose up

build-js:
	docker-compose run web npm run build-js

build: build-js

watch-js:
	docker-compose run web npm run watch-js

watch: watch-js
