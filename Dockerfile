FROM golang:1.26-alpine AS builder

WORKDIR /build

COPY go.mod go.sum ./
RUN go mod download

COPY . ./

RUN CGO_ENABLED=0 go build -o /coredns


FROM alpine:3

ARG USER_UID=1000
USER ${USER_UID}

COPY --from=builder /coredns /coredns

# Reset the working directory inherited from the base image back to the expected default:
# https://github.com/coredns/coredns/issues/7009#issuecomment-3124851608
WORKDIR /

EXPOSE 53 53/udp
ENTRYPOINT ["/coredns"]
