{ inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      # This may also be a string or path to a .toml file.
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };
      shell = {
        font_family = "Maple Mono NF CN";
        screenshot.save_to_file = false;
      };

      audio.enable_sounds = true;

      bar.default = {
        start = [ "cpu" "temp" "ram" "taskbar" ];
        center = [ "workspaces" ];
        end = [
          "media"
          "tray"
          "notifications"
          "network"
          "bluetooth"
          "brightness"
          "volume"
          "battery"
          "clock"
          "control-center"
        ];
        margin_edge = 8;
        margin_ends = 10;
        widget_spacing = true;
      };

      widget = {
        control-center.glyph = "apps";
        media.hide_when_no_media = true;
        workspaces = {
          capsule = true;
          display = "none";
        };
      };

      wallpaper = {
        enabled = true;
        fill_color = "#000000";
        fill_mode = "fit";
        directory = "/home/fern-snowleafie/dotfiles/Pictures/Wallpapers/";
      };

      idle = {
        behavior_order = [ "lock" "screen-off" "lock-and-suspend" ];
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900;
          };
        };
      };
      brightness.enable_ddcutil = true;
      nightlight = {
        enabled = true;
        temperature_night = 2700;
      };
    };
  };
}
