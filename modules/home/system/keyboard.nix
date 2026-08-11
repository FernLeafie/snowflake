{
  config,
  lib,
  pkgs,
  ...
}:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-mozc-ut
        qt6Packages.fcitx5-qt
        fcitx5-gtk
      ];
      settings = {
        globalOptions = {
          "Hotkey/TriggerKeys" = {
            "0" = "Control+Alt+space";
          };
          Behavior = {
            ShareInputState = "All";
          };
        };
        inputMethod = {
          GroupOrder = {
            "0" = "Default";
          };
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "gb";
            DefaultIM = "mozc";
          };
          "Groups/0/Items/0".Name = "keyboard-gb";
          "Groups/0/Items/1".Name = "mozc";
          "Groups/0/Items/2".Name = "keyboard-se-nodeadkeys";
        };
      };
    };
  };
  catppuccin.fcitx5.enableRounded = lib.mkIf (config.home.username == "fern-snowleafie") true;
}
