{ lib, pkgs, ... }:
{
  imports =
    [
      ./kdenlive.nix
      ./obs.nix
    ];

  options = {
    snow.video.enable =
      lib.mkEnableOption "all video editing software" // {
        default = false;
      };
  };

  config = {
    home.packages = with pkgs; [
      yt-dlp
      ffmpeg
    ];
  };
}
