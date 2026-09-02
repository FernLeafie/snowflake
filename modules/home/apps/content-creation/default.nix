{ lib, pkgs, ... }:
{
  imports = [
    ./kdenlive.nix
    ./obs.nix
    ./audacity.nix
  ];

  home.packages = with pkgs; [
    yt-dlp
    ffmpeg
  ];
}
