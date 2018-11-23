{ stdenv, fetchFromGitHub, bash,
  pkgconfig, libevdev, libev, ninja }:
stdenv.mkDerivation rec {
  name = "illum";
  src = fetchFromGitHub {
    url =  "https://github.com/jmesmon/illum";
    owner = "jmesmon";
    repo = "illum";
    fetchSubmodules =  true;
    rev =  "c01c083c3005b1f50eaae19da92b95c9fd90c22d";
    sha256 =  "0qr2jhfj3spnifbcq6idnxifw6wm9ki6z1vw5f06qw05sfgy00m4";
  };
  configurePhase = ''
    ${bash}/bin/bash ./configure
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp illum-{d,ctl} $out/bin
  '';
  buildInputs = [
    pkgconfig
    libevdev
    libev
    ninja
  ];
}
