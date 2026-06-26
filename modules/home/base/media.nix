{ config, pkgs, ... }:
{
  imports =
    [
    ];
  programs.mpv = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.mpv;
    bindings = {
      "s" = "screenshot";
    };
    config = {
      osc = false;
      volume-max = 100;
      osd-font = "Maple Mono NF CN";
    };
    profiles = {
      "extension.mkv" = {
        keep-open = true;
      };
      "extension.gif" = {
        osc = false;
        loop-file = true;
      };
    };
    scripts = with pkgs.mpvScripts; [
      mpris
      thumbfast
      uosc
    ];
    scriptOpts =
      {
        uosc = {
          controls = "menu,gap,<video,audio>subtitles,<has_many_audio>audio,<has_many_video>video,<has_many_edition>editions,<stream>stream-quality,gap,space,play-pause,space,shuffle,loop-playlist,loop-file,gap,prev,items,next,gap,fullscreen";
          controls_persistency = "paused,idle";
          font_bold = true;
          scale_fullscreen = 1.1;
          timeline_persistency = "paused,idle";
          timeline_style = "bar";
          top_bar_persistency = "paused,idle";
          volume = "left";
        };
      };
  };
  programs.zathura = {
    enable = true;
    options = {
      font = "Maple Mono NF CN normal 11";
      selection-clipboard = "clipboard";
    };
  };
}
