{
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  # # [HACK] Currently a bit hacky solution since the config field doesn't support line concatenation
  # # hopefully the settings field will support all needed parameters in the future
  # programs.niri = lib.mkMerge [
  #   (lib.mkIf (config.home.username != "fern-snowleafie") {
  #     config = builtins.readFile ./niri.kdl;
  #   })
  #   (lib.mkIf (config.home.username == "fern-snowleafie") {
  #     config = builtins.readFile ./niri.kdl + ''
  #       // Example: enable rounded corners for all windows.
  #       // (This example rule is commented out with a "/-" in front.)
  #       window-rule {
  #         geometry-corner-radius 10
  #         clip-to-geometry true
  #       }
  #     '';
  #   })
  # ];
  programs.niri.settings = {
    input = {
      keyboard = {
        xkb = {
          layout = "${osConfig.services.xserver.xkb.layout}";
          options = "${osConfig.services.xserver.xkb.options}";
        };
        numlock = true;
      };
      touchpad.dwt = true;
      # tablet.map-to-focused-output = true; # supposedly accepts a string?
      warp-mouse-to-focus.enable = true;
      focus-follows-mouse = {
        enable = true;
        max-scroll-amount = "95%";
      };
    };

    outputs = {
      "eDP-1" = {
        scale = 1;
      };
      "LG Electronics LG TV SSCR2 0x01010101" = {
        # ferns TV
        scale = 2;
      };
      "ASUSTek COMPUTER INC VZ239 GCLMRS004048" = {
        # ferns DP-1
        focus-at-startup = true;
        mode = {
          height = 1080;
          refresh = 74.998;
          width = 1920;
        };
      };
      "ASUSTek COMPUTER INC VZ239 GCLMRS004313" = {
        # ferns DP-2
        mode = {
          height = 1080;
          refresh = 74.998;
          width = 1920;
        };
      };
    };

    layout = {
      gaps = 8;
      background-color = "transparent";

      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
      ];

      border = {
        enable = true;
        width = 2;
        active.color = "#cba6f7";
        inactive.color = "#313244";
        urgent.color = "#f38ba8";
      };
      focus-ring = {
        enable = false;
        width = 2;
        active.color = "#cba6f7";
        inactive.color = "#313244";
        urgent.color = "#f38ba8";
      };

      tab-indicator = {
        hide-when-single-tab = true;
        place-within-column = true;
        gap = 4;
        width = 4;
        gaps-between-tabs = 6;
        corner-radius = lib.mkIf (config.home.username == "fern-snowleafie") 8;
        position = "right";
        length.total-proportion = 1.0; # Amount of window height taken up
        active.color = "#cba6f7";
        inactive.color = "#45475a";
        urgent.color = "#f38ba8";
      };
      insert-hint.display.color = "#cba6f780";
    };
    recent-windows = {
      highlight = {
        active-color = "#cba6f7ff";
        urgent-color = "#f38ba8ff";
        padding = 10;
        corner-radius = lib.mkIf (config.home.username == "fern-snowleafie") 10;
      };
    };
    blur = {
      enable = true;
      passes = 1;
      offset = 8;
      noise = 0.04;
      saturation = 1;
    };

    overview.zoom = 0.25;

    # Possibly make use of lib.getExe in the future
    spawn-at-startup = [
      { sh = "noctalia"; }
    ];

    # Move over to non niri specific environment variables
    environment = {
      QT_QPA_PLATFORM = "wayland";
      # XDG_MENU_PREFIX = "plasma-";
      DISPLAY = null;
      # Should cause electron 28 applications and above to prefer Wayland
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      # sets awww transition type
      AWWW_TRANSITION = "wipe";
      AWWW_TRANSITION_FPS = "60";
    };

    prefer-no-csd = true;
    cursor = {
      size = 24;
      theme = "breeze_cursors";
    };

    binds = {
      "Mod+Return" = {
        action.spawn-sh = "kitty";
        hotkey-overlay.title = "Open a Terminal: Kitty";
      };
      "Mod+O" = {
        action.toggle-overview = { };
        repeat = false;
      };
      "Mod+Shift+O".action.show-hotkey-overlay = { };
      "Mod+Space" = {
        action.spawn-sh = "noctalia msg panel-toggle launcher";
        hotkey-overlay.title = "Open application launcher";
      };
      "Mod+E" = {
        action.spawn-sh = "dolphin";
        hotkey-overlay.title = "Open a File manager: Dolphin";
      };
      "Mod+B" = {
        action.spawn-sh = "dolphin";
        hotkey-overlay.title = "Open a Browser: Firefox";
      };
      "Mod+Alt+L" = {
        action.spawn-sh = "noctalia msg session lock";
        hotkey-overlay.title = "Lock the Screen";
      };
      "Mod+N" = {
        action.spawn-sh = "noctalia msg panel-toggle wallpaper";
        hotkey-overlay.title = "Open wallpaper switcher";
      };
      "Mod+V" = {
        action.spawn-sh = "noctalia msg panel-toggle clipboard";
        hotkey-overlay.title = "Open clipboard history";
      };
      "Alt+tab".action.spawn-sh = "noctalia msg window-switcher";
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg volume-up";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg volume-down";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg volume-mute";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg mic-mute";
      };
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg brightness-up";
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg brightness-down";
      };

      "XF86AudioPlay" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg media toggle";
      };
      "XF86AudioPause" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg media toggle";
      };
      "XF86AudioNext" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg media next";
      };
      "XF86AudioPrev" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg media previous";
      };
      "XF86AudioStop" = {
        allow-when-locked = true;
        action.spawn-sh = "noctalia msg media stop";
      };

      "Mod+Q".action.close-window = { };

      "Mod+Left".action.focus-column-left = { };
      "Mod+Down".action.focus-window-down = { };
      "Mod+Up".action.focus-window-up = { };
      "Mod+Right".action.focus-column-right = { };
      "Mod+H".action.focus-column-left = { };
      "Mod+J".action.focus-window-down = { };
      "Mod+K".action.focus-window-up = { };
      "Mod+L".action.focus-column-right = { };

      "Mod+Ctrl+Left".action.move-column-left = { };
      "Mod+Ctrl+Down".action.move-window-down = { };
      "Mod+Ctrl+Up".action.move-window-up = { };
      "Mod+Ctrl+Right".action.move-column-right = { };
      "Mod+Ctrl+H".action.move-column-left = { };
      "Mod+Ctrl+J".action.move-window-down = { };
      "Mod+Ctrl+K".action.move-window-up = { };
      "Mod+Ctrl+L".action.move-column-right = { };

      "Mod+Home".action.focus-column-first = { };
      "Mod+End".action.focus-column-last = { };
      "Mod+Ctrl+Home".action.move-column-to-first = { };
      "Mod+Ctrl+End".action.move-column-to-last = { };

      "Mod+Shift+Left".action.focus-monitor-left = { };
      "Mod+Shift+Down".action.focus-monitor-down = { };
      "Mod+Shift+Up".action.focus-monitor-up = { };
      "Mod+Shift+Right".action.focus-monitor-right = { };
      "Mod+Shift+H".action.focus-monitor-left = { };
      "Mod+Shift+J".action.focus-monitor-down = { };
      "Mod+Shift+K".action.focus-monitor-up = { };
      "Mod+Shift+L".action.focus-monitor-right = { };

      "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = { };
      "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = { };
      "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = { };
      "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = { };
      "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = { };
      "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = { };
      "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = { };
      "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = { };

      "Mod+Page_Down".action.focus-workspace-down = { };
      "Mod+Page_Up".action.focus-workspace-up = { };
      "Mod+U".action.focus-workspace-down = { };
      "Mod+I".action.focus-workspace-up = { };
      "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = { };
      "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = { };
      "Mod+Ctrl+U".action.move-column-to-workspace-down = { };
      "Mod+Ctrl+I".action.move-column-to-workspace-up = { };

      "Mod+Shift+Page_Down".action.move-workspace-down = { };
      "Mod+Shift+Page_Up".action.move-workspace-up = { };
      "Mod+Shift+U".action.move-workspace-down = { };
      "Mod+Shift+I".action.move-workspace-up = { };

      "Mod+WheelScrollDown" = {
        cooldown-ms = 150;
        action.focus-workspace-down = { };
      };
      "Mod+WheelScrollUp" = {
        cooldown-ms = 150;
        action.focus-workspace-up = { };
      };
      "Mod+Ctrl+WheelScrollDown" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-down = { };
      };
      "Mod+Ctrl+WheelScrollUp" = {
        cooldown-ms = 150;
        action.move-column-to-workspace-up = { };
      };

      "Mod+WheelScrollRight".action.focus-column-right = { };
      "Mod+WheelScrollLeft".action.focus-column-left = { };
      "Mod+Ctrl+WheelScrollRight".action.move-column-right = { };
      "Mod+Ctrl+WheelScrollLeft".action.move-column-left = { };

      "Mod+Shift+WheelScrollDown".action.focus-column-right = { };
      "Mod+Shift+WheelScrollUp".action.focus-column-left = { };
      "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = { };
      "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = { };

      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;
      "Mod+Ctrl+1".action.move-column-to-workspace = 1;
      "Mod+Ctrl+2".action.move-column-to-workspace = 2;
      "Mod+Ctrl+3".action.move-column-to-workspace = 3;
      "Mod+Ctrl+4".action.move-column-to-workspace = 4;
      "Mod+Ctrl+5".action.move-column-to-workspace = 5;
      "Mod+Ctrl+6".action.move-column-to-workspace = 6;
      "Mod+Ctrl+7".action.move-column-to-workspace = 7;
      "Mod+Ctrl+8".action.move-column-to-workspace = 8;
      "Mod+Ctrl+9".action.move-column-to-workspace = 9;

      "Mod+Comma".action.consume-or-expel-window-left = { };
      "Mod+Period".action.consume-or-expel-window-right = { };

      "Mod+R".action.switch-preset-column-width = { };
      "Mod+Shift+R".action.switch-preset-window-height = { };
      "Mod+Ctrl+R".action.reset-window-height = { };
      "Mod+F".action.maximize-column = { };
      "Mod+Shift+F".action.fullscreen-window = { };

      "Mod+Ctrl+F".action.expand-column-to-available-width = { };

      "Mod+C".action.center-column = { };

      "Mod+Ctrl+C".action.center-visible-columns = { };

      "Mod+Minus".action.set-column-width = "-10%";
      "Mod+Plus".action.set-column-width = "+10%";

      "Mod+Shift+Minus".action.set-window-height = "-10%";
      "Mod+Shift+Plus".action.set-window-height = "+10%";

      "Mod+D".action.toggle-window-floating = { };
      "Mod+Shift+D".action.switch-focus-between-floating-and-tiling = { };

      "Mod+W".action.toggle-column-tabbed-display = { };

      "Print".action.spawn-sh = "noctalia msg screenshot-region";
      "Ctrl+Print".action.spawn-sh = "noctalia msg screenshot-fullscreen";
      "Alt+Print".action.screenshot-window = {
        write-to-disk = false;
      };

      "Mod+Escape" = {
        allow-inhibiting = false;
        action.toggle-keyboard-shortcuts-inhibit = { };
      };

      "Mod+Shift+E".action.quit = { };
      "Ctrl+Alt+Delete".action.quit = { };

      "Mod+Shift+P".action.power-off-monitors = { };
    };

    layer-rules = [
      {
        matches = [ { namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$"; } ];
        background-effect.xray = false;
      }
      {
        matches = [ { namespace = "^noctalia-wallpaper$"; } ];
        place-within-backdrop = true;
      }
      {
        matches = [ { namespace = "^awww-daemon$"; } ];
        place-within-backdrop = true;
      }
    ];

    window-rules = [
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
      {
        matches = [ { app-id = "discord"; } ];
        open-on-output = "DP-2";
      }
      {
        geometry-corner-radius = lib.mkIf (config.home.username == "fern-snowleafie") {
          bottom-left = 10.0;
          bottom-right = 10.0;
          top-left = 10.0;
          top-right = 10.0;
        };
        clip-to-geometry = true;
        background-effect = {
          blur = true;
          xray = true;
        };
      }
    ];
  };
}
