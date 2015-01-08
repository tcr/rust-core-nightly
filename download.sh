#!/bin/bash

rm -rf rust || true
git clone https://github.com/rust-lang/rust --depth 1
rm -rf core/src
cp -rf rust/src/libcore core/
mv core/libcore core/src

# rm rust-nightly*.tar.gz* || true
# wget https://static.rust-lang.org/dist/rust-nightly-src.tar.gz
# rm -rf core/src
# mkdir -p core/src
# tar -xvf rust-nightly-src.tar.gz -C core/src --strip-components=3 rust-nightly/src/libcore

node -e "d=new Date();fs=require('fs');a=fs.readFileSync('./core/Cargo.toml','utf-8');fs.writeFileSync('./core/Cargo.toml',a.replace(/^version.*/m,'version=\"'+(d.getFullYear())+'.'+(d.getMonth()+1)+'.'+(d.getDate())+'\"'))"

rm a.out
rustc core/src/lib.rs -o a.out
