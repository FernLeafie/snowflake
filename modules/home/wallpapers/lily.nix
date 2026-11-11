{
  lib,
  fetchFromGitHub,
  stdenvNoCC,
  ...
}:
let
  pname = "wallpapers";
  version = "0.1";
in
stdenvNoCC.mkDerivation {
  inherit pname version;

  src = fetchFromGitHub {
    owner = "CodedKyoko";
    repo = "wallpapers";
    rev = "c950c62b15f1a5ef64e3bb9cd345856947a06861";
    sha256 = "cVp6j+KuvKxgTyICCuiCZfNR71+uxSqdk8ywtzyRNXw=";
    rootDir = "wallpapers";
  };

  strictDeps = true;

  preInstall = ''
    mkdir -p $out
  '';

  installPhase = ''
    runHook preInstall
    cp -r $src/* $out
    runHook postInstall
  '';

  meta = {
    description = "lilys-personal-wallpaper-collection";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
