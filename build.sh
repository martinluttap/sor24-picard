#!/bin/bash -x
set -o pipefail
SOFTWARE="picard"
BASE_CONTAINER_REGISTRY="${BASE_CONTAINER_REGISTRY:-docker.osdc.io}"
BUILD_ROOT_DIR=$(pwd)
GIT_SHORT_HASH=$(git rev-parse --short HEAD)

# Initialize Registry array
REGISTRIES=("ghcr.io")

#!/bin/bash

set -eo pipefail

function build {
	just build $1
}

function publish {
	just publish $1
}

case "$1" in
	build) 
		for version in *; do
			if [ -d "${version}" ]; then
				echo "Building $version"
		        build $version
			fi
		done
	;;
	publish)
		for version in *; do
			if [ -d "${version}" ]; then
				echo "Publishing $version"
		        publish $version
			fi
		done
	;;
esac