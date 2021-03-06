# Abort if anything fails
set -e

docker build --file ./tools/lint/go.dockerfile --tag home-automation-go-fmt --quiet .
docker run --rm -t \
	-v "$PWD":/go/src/home-automation \
	home-automation-go-fmt

docker build --file ./tools/lint/js.dockerfile --tag home-automation-js-fmt --quiet .
docker run --rm -t \
	-v "$PWD":/usr/src/home-automation \
	home-automation-js-fmt
