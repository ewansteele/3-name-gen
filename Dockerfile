FROM golang:alpine as builder
ADD namegen.go /build/
WORKDIR /build 
RUN go build -o namegen .
RUN chmod +x /build/namegen

FROM alpine
RUN adduser -S -D -H -h /app appuser
USER appuser
COPY --from=builder /build/namegen /app/
WORKDIR /app
CMD ["./namegen"]