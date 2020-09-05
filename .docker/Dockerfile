FROM --platform=${BUILDPLATFORM} golang:1.14.4-alpine3.12 AS build
ARG TARGETOS
ARG TARGETARCH
ENV CGO_ENABLED=0 \
    GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH}
ADD ./src /go/src
WORKDIR /go/src/github.com/kaissi/fct7-devops-cd-desafio-final
RUN go build -ldflags '-w -s' -a -installsuffix cgo -o /go/bin/desafio-final-ci \
    && apk add --no-cache upx \
    && upx --brute /go/bin/desafio-final-ci

FROM --platform=${TARGETPLATFORM} scratch
COPY --from=build /go/bin/desafio-final-ci /usr/local/bin/
EXPOSE 8080
ENTRYPOINT [ "desafio-final-ci" ]