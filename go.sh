#!/bin/bash

rm rust-nightly.tar.gz || true
wget https://static.rust-lang.org/dist/rust-nightly-src.tar.gz
rm -rf core/src
mkdir -p core/src
tar -xvf rust-nightly-src.tar.gz -C core/src --strip-components=3 rust-nightly/src/libcore