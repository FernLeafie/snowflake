{ inputs, config, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  xdg.configFile."noctalia/palettes/catppuccin-mocha-mauve.json".text = builtins.readFile ./catppuccin-mocha-mauve.json;
  xdg.configFile."noctalia/icons/nix.svg".text = builtins.readFile ./nix.svg;
  xdg.configFile."noctalia/icons/nix-coloured.svg".text = builtins.readFile ./nix-coloured.svg;
  xdg.configFile."noctalia/icons/nix-rainbow.svg".text = builtins.readFile ./nix-rainbow.svg;

  programs.noctalia = {
    enable = true;

    settings = {
      # This may also be a string or path to a .toml file.
      theme = {
        mode = "dark";
        source = "custom";
        builtin = "Catppuccin";
        custom_palette = "catppuccin-mocha-mauve";
        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };
      shell = {
        font_family = "Maple Mono NF CN";
        screenshot.save_to_file = false;
        panel.transparency = "soft";
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
        margin_ends = 8;
        thickness = 30;
        widget_spacing = 10;
        border = "surface_variant";
        border_width = 2.0;
        panel_overlap = 2;
      };

      widget = {
        control-center = {
          glyph = "apps";
          custom_image = "${config.xdg.configHome}/noctalia/icons/nix-coloured.svg";
          scale = 1.25;
        };
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
        directory = "${config.xdg.userDirs.pictures}/wallpapers/";
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
