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
  xdg.configFile."qimgv/qimgv.conf".text = ''
    [General]
    JPEGSaveQuality=95
    autoResizeLimit=90
    autoResizeWindow=false
    backgroundOpacity=0.7
    blurBackground=true
    clickableEdges=true
    clickableEdgesVisible=true
    confirmDelete=true
    confirmTrash=true
    cursorAutohiding=true
    defaultCropAction=0
    defaultFitMode=0
    defaultViewMode=0
    drawTransparencyGrid=true
    enableSmoothScroll=true
    expandImage=true
    expandLimit=0
    firstRun=false
    fixedZoomLevels="0.05,0.1,0.125,0.166,0.25,0.333,0.5,0.66,1,1.5,2,3,4,5,6,7,8"
    focusPointIn1to1Mode=1
    folderEndAction=0
    folderViewIconSize=120
    imageScrolling=1
    infoBarFullscreen=true
    infoBarWindowed=true
    jxlAnimation=false
    keepFitMode=false
    language=en_US
    lastVerMajor=1
    lastVerMicro=3
    lastVerMinor=0
    loopSlideshow=false
    memoryAllocationLimit=1024
    mouseScrollingSpeed=1
    mpvBinary=${lib.getExe pkgs.mpv}
    openInFullscreen=false
    panelCenterSelection=false
    panelEnabled=true
    panelFullscreenOnly=true
    panelPinned=false
    panelPosition=top
    panelPreviewsSize=140
    playVideoSounds=false
    scalingFilter=3
    showHiddenFiles=false
    showSaveOverlay=true
    slideshowInterval=3000
    smoothAnimatedImages=true
    smoothUpscaling=true
    sortFolders=true
    sortingMode=0
    squareThumbnails=false
    thumbPanelStyle=1
    thumbnailCache=true
    thumbnailerThreads=4
    trackpadDetection=true
    unloadThumbs=true
    unlockMinZoom=true
    useFixedZoomLevels=false
    usePreloader=true
    useSystemColorScheme=true
    videoPlayback=true
    windowTitleExtendedInfo=false
    zoomIndicatorMode=0
    zoomStep=0.2

    [Controls]
    shortcuts="zoomIn=+", "frameStepBack=,", "zoomOut=-", "frameStep=.", "fitWindow=1", "fitWidth=2", "fitNormal=3", "zoomIn=eq", "exit=Alt+X", "folderView=Backspace", "copyFile=C", "zoomIn=Ctrl++", "zoomOut=Ctrl+-", "zoomIn=Ctrl+eq", "copyFileClipboard=Ctrl+C", "showInDirectory=Ctrl+D", "zoomOut=Ctrl+Down", "rotateLeft=Ctrl+L", "seekVideoBackward=Ctrl+Left", "open=Ctrl+O", "print=Ctrl+P", "exit=Ctrl+Q", "rotateRight=Ctrl+R", "seekVideoForward=Ctrl+Right", "save=Ctrl+S", "copyPathClipboard=Ctrl+Shift+C", "saveAs=Ctrl+Shift+S", "zoomIn=Ctrl+Up", "pasteFile=Ctrl+V", "setWallpaper=Ctrl+W", "zoomOutCursor=Ctrl+WheelDown", "zoomInCursor=Ctrl+WheelUp", "discardEdits=Ctrl+Z", "toggleShuffle=Ctrl+`", "moveToTrash=Del", "scrollDown=Down", "toggleScalingFilter=E", "jumpToLast=End", "folderView=Enter", "closeFullScreenOrExit=Esc", "toggleFullscreen=F", "toggleFullscreen=F11", "renameFile=F2", "reloadImage=F5", "flipH=H", "jumpToFirst=Home", "toggleImageInfo=I", "toggleFullscreen=LMB_DoubleClick", "prevImage=Left", "moveFile=M", "contextMenu=Menu", "exit=MiddleButton", "openSettings=P", "exit=Q", "resize=R", "contextMenu=RMB", "nextImage=Right", "removeFile=Shift+Del", "toggleFullscreenInfoBar=Shift+F", "prevDirectory=Shift+Left", "nextDirectory=Shift+Right", "nextImage=Shift+WheelDown", "prevImage=Shift+WheelUp", "toggleFitMode=Space", "scrollUp=Up", "flipV=V", "zoomOutCursor=WheelDown", "zoomInCursor=WheelUp", "crop=X", "prevImage=XButton1", "nextImage=XButton2", "toggleSlideshow=`"

    [Scripts]
    script\size=0
  '';
}
