FROM golang:1.21.6-alpine AS builder
WORKDIR /go
COPY . .
RUN  go build -o rocks rocks.go


FROM scratch
WORKDIR /
COPY --from=builder /go/rocks .
ENTRYPOINT ["./rocks"]


