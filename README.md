# Docker Audiowaveform Alpine Builder
Build side docker container to use in multistage builds for reducing total container size

* [Source repo bbc/audiowaveform](https://github.com/bbc/audiowaveform)
* [This repo](https://github.com/gsix/docker-audiowaveform-alpine) is alpine Dockerfile with **audiowaveform** building in it
* [Docker Hub Container](https://hub.docker.com/r/genesix/docker-audiowaveform-alpine) with builded **audiowaveform** binaries. (**audiowaveform** and **audiowaveform_test** are in /bin directory)

## Usage in multistage builds
Link container and copy binaries from it. Don't forget about required libraries.
```
FROM genesix/docker-audiowaveform-alpine:latest as audiowaveform-builder

FROM alpine:3.9

RUN apk add --no-cache libmad libsndfile libid3tag gd boost boost-program_options

COPY --from=audiowaveform-builder /bin/audiowaveform /usr/local/bin
```
