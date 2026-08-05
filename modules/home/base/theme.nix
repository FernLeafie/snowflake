{
  inputs,
  config,
  pkgs,
  ...
}:
{
  # imports = [
  #   inputs.catppuccin.homeModules.catppuccin
  # ];
  catppuccin = {
    kvantum.enable = false;
    qt5ct.enable = true;
  };
  qt = rec {
    enable = true;
    platformTheme.name = "qtct";
    qt5ctSettings = qt6ctSettings;
    qt6ctSettings = {
      Appearance = {
        icon_theme = "Papirus-Dark";
        standard_dialogs = "default"; # xdgdesktopportal
        style = "Darkly";
      };
      Fonts = {
        fixed = "\"Maple Mono NF CN,10\"";
        general = "\"Maple Mono NF CN,10\"";
      };
    };
    style = {
      name = "qt6ct";
      package = pkgs.darkly; # kdePackages.breeze
    };
  };

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
  gtk = {
    enable = true;
    colorScheme = "dark";
    font = {
      package = pkgs.maple-mono.NF-CN;
      name = "Maple Mono NF CN";
    };
  };

  home = {
    pointerCursor = {
      enable = true;
      name = "breeze_cursors"; # or BreezeX-RosePine-Linux
      package = pkgs.kdePackages.breeze; # or pkgs.rose-pine-cursor
      gtk.enable = true;
      x11.enable = true;
    };
  };
  # [HACK] for applications that don't properly behave and use the built-in theme right away, this fixes some issues with mangareader and krita temporarily
  # [NOTE] preferably fetch from catppuccin GitHub https://github.com/catppuccin/kde/releases/
  xdg.dataFile = rec {
    "color-schemes/CatppuccinMochaMauve.colors".text = ''
      [ColorEffects:Disabled]
      Color=30, 30, 46
      ColorAmount=0.30000000000000004
      ColorEffect=2
      ContrastAmount=0.1
      ContrastEffect=0
      IntensityAmount=-1
      IntensityEffect=0

      [ColorEffects:Inactive]
      ChangeSelectionColor=true
      Color=30, 30, 46
      ColorAmount=0.5
      ColorEffect=3
      ContrastAmount=0
      ContrastEffect=0
      Enable=true
      IntensityAmount=0
      IntensityEffect=0

      [Colors:Button]
      BackgroundAlternate=203,166,247
      BackgroundNormal=49, 50, 68
      DecorationFocus=203,166,247
      DecorationHover=49, 50, 68
      ForegroundActive=250, 179, 135
      ForegroundInactive=166, 173, 200
      ForegroundLink=203,166,247
      ForegroundNegative=243, 139, 168
      ForegroundNeutral=249, 226, 175
      ForegroundNormal=205, 214, 244
      ForegroundPositive=166, 227, 161
      ForegroundVisited=203, 166, 247


      [Colors:Complementary]
      BackgroundAlternate=17, 17, 27
      BackgroundNormal=24, 24, 37
      DecorationFocus=203,166,247
      DecorationHover=49, 50, 68
      ForegroundActive=250, 179, 135
      ForegroundInactive=166, 173, 200
      ForegroundLink=203,166,247
      ForegroundNegative=243, 139, 168
      ForegroundNeutral=249, 226, 175
      ForegroundNormal=205, 214, 244
      ForegroundPositive=166, 227, 161
      ForegroundVisited=203, 166, 247


      [Colors:Header]
      BackgroundAlternate=17, 17, 27
      BackgroundNormal=24, 24, 37
      DecorationFocus=203,166,247
      DecorationHover=49, 50, 68
      ForegroundActive=250, 179, 135
      ForegroundInactive=166, 173, 200
      ForegroundLink=203,166,247
      ForegroundNegative=243, 139, 168
      ForegroundNeutral=249, 226, 175
      ForegroundNormal=205, 214, 244
      ForegroundPositive=166, 227, 161
      ForegroundVisited=203, 166, 247


      [Colors:Selection]
      BackgroundAlternate=203,166,247
      BackgroundNormal=203,166,247
      DecorationFocus=203,166,247
      DecorationHover=49, 50, 68
      ForegroundLink=203,166,247
      ForegroundInactive=24, 24, 37
      ForegroundActive=250, 179, 135
      ForegroundLink=203,166,247
      ForegroundNegative=243, 139, 168
      ForegroundNeutral=249, 226, 175
      ForegroundNormal=17, 17, 27
      ForegroundPositive=166, 227, 161
      ForegroundVisited=203, 166, 247


      [Colors:Tooltip]
      BackgroundAlternate=27,25,35
      BackgroundNormal=30, 30, 46
      DecorationFocus=203,166,247
      DecorationHover=49, 50, 68
      ForegroundActive=250, 179, 135
      ForegroundInactive=166, 173, 200
      ForegroundLink=203,166,247
      ForegroundNegative=243, 139, 168
      ForegroundNeutral=249, 226, 175
      ForegroundNormal=205, 214, 244
      ForegroundPositive=166, 227, 161
      ForegroundVisited=203, 166, 247


      [Colors:View]
      BackgroundAlternate=24, 24, 37
      BackgroundNormal=30, 30, 46
      DecorationFocus=203,166,247
      DecorationHover=49, 50, 68
      ForegroundActive=250, 179, 135
      ForegroundInactive=166, 173, 200
      ForegroundLink=203,166,247
      ForegroundNegative=243, 139, 168
      ForegroundNeutral=249, 226, 175
      ForegroundNormal=205, 214, 244
      ForegroundPositive=166, 227, 161
      ForegroundVisited=203, 166, 247


      [Colors:Window]
      BackgroundAlternate=17, 17, 27
      BackgroundNormal=24, 24, 37
      DecorationFocus=203,166,247
      DecorationHover=49, 50, 68
      ForegroundActive=250, 179, 135
      ForegroundInactive=166, 173, 200
      ForegroundLink=203,166,247
      ForegroundNegative=243, 139, 168
      ForegroundNeutral=249, 226, 175
      ForegroundNormal=205, 214, 244
      ForegroundPositive=166, 227, 161
      ForegroundVisited=203, 166, 247


      [General]
      ColorScheme=CatppuccinMochaMauve
      Name=Catppuccin Mocha Mauve
      accentActiveTitlebar=false
      shadeSortColumn=true


      [KDE]
      contrast=4


      [WM]
      activeBackground=30, 30, 46
      activeBlend=205, 214, 244
      activeForeground=205, 214, 244
      inactiveBackground=17, 17, 27
      inactiveBlend=166, 173, 200
      inactiveForeground=166, 173, 200
    '';
  };
}
