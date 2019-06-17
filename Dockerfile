FROM alpine:3.9

RUN apk add --no-cache git make cmake gcc g++ libmad-dev \
                       libid3tag-dev libsndfile-dev gd-dev boost-dev \
    && git clone https://github.com/bbcrd/audiowaveform.git \
    && cd audiowaveform \   
    && wget https://github.com/google/googletest/archive/release-1.8.0.tar.gz \
    && tar xzf release-1.8.0.tar.gz \
    && ln -s googletest-release-1.8.0/googletest googletest \
    && ln -s googletest-release-1.8.0/googlemock googlemock \              
    && mkdir build \
    && cd build \
    && cmake .. \
    && make \
    && cp audiowaveform* /bin \
    && cd \
    && rm -rf /audiowaveform