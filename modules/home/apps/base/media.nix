{
  config,
  lib,
  pkgs,
  ...
}:
{
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
    scriptOpts = {
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
  home.packages = with pkgs; [
    qimgv
    kdePackages.gwenview
  ];
  qt.kde.settings."qimgv/qimgv.conf" = {
    General = {
      useSystemColorScheme = true;
      backgroundOpacity = 0.7;
      drawTransparencyGrid = true;

      clickableEdges = true;

      expandImage = true;
      expandLimit = 0;

      infoBarWindowed = true;

      mpvBinary = lib.getExe pkgs.mpv;
      windowTitleExtendedInfo = false;

    };
    Controls = {
      shortcuts = ''
        "zoomIn=+", "frameStepBack=,", "zoomOut=-", "frameStep=.", "fitWindow=1", "fitWidth=2", "fitNormal=3", "zoomIn=eq", "exit=Alt+X", "folderView=Backspace", "copyFile=C", "zoomIn=Ctrl++", "zoomOut=Ctrl+-", "zoomIn=Ctrl+eq", "copyFileClipboard=Ctrl+C", "showInDirectory=Ctrl+D", "zoomOut=Ctrl+Down", "rotateLeft=Ctrl+L", "seekVideoBackward=Ctrl+Left", "open=Ctrl+O", "print=Ctrl+P", "exit=Ctrl+Q", "rotateRight=Ctrl+R", "seekVideoForward=Ctrl+Right", "save=Ctrl+S", "copyPathClipboard=Ctrl+Shift+C", "saveAs=Ctrl+Shift+S", "zoomIn=Ctrl+Up", "pasteFile=Ctrl+V", "setWallpaper=Ctrl+W", "zoomOutCursor=Ctrl+WheelDown", "zoomInCursor=Ctrl+WheelUp", "discardEdits=Ctrl+Z", "toggleShuffle=Ctrl+`", "moveToTrash=Del", "scrollDown=Down", "toggleScalingFilter=E", "jumpToLast=End", "folderView=Enter", "closeFullScreenOrExit=Esc", "toggleFullscreen=F", "toggleFullscreen=F11", "renameFile=F2", "reloadImage=F5", "flipH=H", "jumpToFirst=Home", "toggleImageInfo=I", "toggleFullscreen=LMB_DoubleClick", "prevImage=Left", "moveFile=M", "contextMenu=Menu", "exit=MiddleButton", "openSettings=P", "exit=Q", "resize=R", "contextMenu=RMB", "nextImage=Right", "removeFile=Shift+Del", "toggleFullscreenInfoBar=Shift+F", "prevDirectory=Shift+Left", "nextDirectory=Shift+Right", "nextImage=Shift+WheelDown", "prevImage=Shift+WheelUp", "toggleFitMode=Space", "scrollUp=Up", "flipV=V", "zoomOutCursor=WheelDown", "zoomInCursor=WheelUp", "crop=X", "prevImage=XButton1", "nextImage=XButton2", "toggleSlideshow=`"
      '';
    };
  };
}
