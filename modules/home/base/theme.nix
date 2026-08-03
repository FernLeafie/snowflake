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
        standard_dialogs = "default"; #xdgdesktopportal
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
}
