{ lib, pkgs, ... }:
{
  imports = [
    ./kdenlive.nix
    ./obs.nix
  ];

  home.packages = with pkgs; [
    yt-dlp
    ffmpeg
  ];
}
