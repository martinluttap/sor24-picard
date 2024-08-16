SOFTWARE := "picard"

# Builds individual software version
build VERSION:
   just {{VERSION}}/build-docker

publish VERSION: 
   just {{VERSION}}/publish-docker

# Builds all docker images for each directory with a justfile
build-all:
    #!/bin/bash
    for dir in `ls .`; do
        if [ -d "${dir}" ]; then
            if [ -f "${dir}"/justfile ]; then
                just build "${dir}";
            fi
        fi
    done

# Publish all docker images
publish-all:
    #!/bin/bash
    for dir in `ls .`; do
        if [ -d "${dir}" ]; then
            if [ -f "${dir}"/justfile ]; then
                just publish "${dir}";
            fi
        fi
    done
