FROM rust:bookworm AS builder

RUN \
  mkdir /root/mtv && \
  mkdir /root/mtv/src 

WORKDIR /root/mtv

COPY Cargo.lock .
COPY Cargo.toml .

WORKDIR /root/mtv/src

COPY src/main.rs .

WORKDIR /root/mtv

RUN cargo build --release


FROM debian:bookworm-slim

WORKDIR /usr/bin

COPY --from=builder /root/mtv/target/release/mtv_frontend_server .

RUN chmod -R +rwx /usr/bin/mtv_frontend_server

WORKDIR /

RUN \
  mkdir /root/mtv && \
  mkdir /root/mtv/data

WORKDIR /root/mtv/data

COPY data/ .

EXPOSE 8080

STOPSIGNAL SIGINT

# CMD ["tail", "-f", "/dev/null"]
CMD ["/usr/bin/mtv_frontend_server"]
