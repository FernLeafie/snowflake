{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;

    # font = {
    #   name = "Maple Mono NF CN";
    #   size = 11;
    # };

    # [FIXME] pls upstream a font.features config <3
    extraConfig = ''
      font_family family="Maple Mono NF CN" size=11 features="+cv09 +cv10 +cv42 +cv43 +ss03 +ss09 +ss10"
    ''; # stroked 7, z, stroked italic 7, z, lowercase badge, ~=, =~

    shellIntegration.enableFishIntegration = true;

    settings = {
      tab_bar_min_tabs = 1;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) > if num_windows > 1 else ''}";
      tab_bar_margin_width = 0.0;

      scrollback_lines = 10000;
      scrollback_pager_history_size = 10;

      dynamic_background_opacity = true;
      background_opacity = 0.9;
      cursor_trail = 1;
    };
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
    };
  };
  qt.kde.settings.kdeglobals.General = {
    TerminalApplication = lib.getExe pkgs.kitty;
    TerminalService = "kitty.service";
  };
}
