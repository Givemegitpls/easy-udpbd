FROM rust:1.90.0 AS builder

RUN git clone --branch v0.2.0 --recursive https://github.com/awaken1ng/udpbd-vexfat.git
WORKDIR ./udpbd-vexfat
RUN sed -i 's/a.sub(T::one()).div(b).add(T::one())/if a.is_zero() { T::zero() } else { a.sub(T::one()).div(b).add(T::one()) }/' src/utils.rs
RUN cargo install --path .
RUN mkdir /ps2

ENV RUST_BACKTRACE=1
ENV RUST_BACKTRACE=full

CMD ["udpbd-vexfat", "/ps2"] 

