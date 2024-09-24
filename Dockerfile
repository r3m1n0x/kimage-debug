FROM alpine:3.20.3

RUN apk update && apk upgrade
RUN apk add --no-cache bash \
                        curl \
                        wget \
                        git \
                        vim \
                        nmap \
                        bind-tools \
                        kubectl \
                        helm

# INSTALL ADITIONAL TOOLS FOR DEBUGGING
RUN apk add --no-cache mtr \
                        tcpdump \
                        iperf3 \
                        iputils \
                        iproute2 \
                        net-tools \
                        nmap

# INSTALL GO
RUN apk add --no-cache musl-dev \
                        go

ENV GOROOT=/usr/lib/go
ENV GOPATH=/go
ENV PATH=/go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

# INSTALL DNSPYRE
RUN go install github.com/tantalor93/dnspyre/v2@latest
            
WORKDIR /root

CMD ["/bin/bash"]