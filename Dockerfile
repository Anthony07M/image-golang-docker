FROM golang:alpine as builder

WORKDIR /app

COPY . .

RUN go build -a -installsuffix cgo -o main .

FROM scratch

WORKDIR /app

COPY --from=builder /app/main .

CMD ["./main"]
