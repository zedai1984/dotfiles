let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
  ruststable = (nixpkgs.latest.rustChannels.stable.rust.override { extensions = [ "rust-src" "clippy-preview" "rls-preview" "rust-analysis" "rustfmt-preview" ];});
in
with nixpkgs;
mkShell {
  buildInputs = [ 
    openssl 
    pkg-config
    nasm
    ruststable
    rustup
    cmake
    zlib 
  ];

  shellHook = ''
    export PATH=$HOME/.cargo/bin:$PATH
  '';
}

