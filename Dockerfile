FROM golang:1.8-alpine AS builder

WORKDIR /app

COPY . .
RUN go build -v -o /usr/local/bin/app ./...

CMD ["app"]

FROM scratch

WORKDIR /
COPY --from=builder /usr/local/bin/app ./
CMD ["./app"]