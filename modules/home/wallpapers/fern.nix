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
    owner = "FernLeafie";
    repo = "wallpapers";
    rev = "8e48463f04d500055357d811720c06424b3b63fc";
    sha256 = "1S6C/e7PoaVHeTh2vg0JkGMM0swXwcqwi8lgFjMDMz0=";
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
    description = "ferns-personal-wallpaper-collection";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
  };
}
