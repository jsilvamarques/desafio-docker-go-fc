FROM golang:alpine AS builder
WORKDIR /src
COPY ./main .
RUN go build main.go

FROM scratch
WORKDIR /src
COPY --from=builder /src .
CMD ["./main"]