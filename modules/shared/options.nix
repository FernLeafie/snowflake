{ lib, config, ... }:
let
  inherit (lib) mkEnableOption;

  cfg = config.snow;
in
{
  options.snow = {
    graphical = {
      enable = mkEnableOption "Enable graphics editing software";

      gimp.enable = mkEnableOption "Enable Gimp" // {
        default = cfg.graphical.enable;
      };

      inkscape.enable = mkEnableOption "Enable Inkscape" // {
        default = cfg.graphical.enable;
      };

      krita.enable = mkEnableOption "Enable Krita" // {
        default = cfg.graphical.enable;
      };
    };

    video = {
      enable = mkEnableOption "Enable video editing software";

      kdenlive.enable = mkEnableOption "Enable Kdenlive" // {
        default = cfg.video.enable;
      };

      obs.enable = mkEnableOption "Enable OBS-Studio" // {
        default = cfg.video.enable;
      };
    };

    gaming = {
      enable = mkEnableOption "Enable gaming software";

      star-citizen.enable = mkEnableOption "Enable Star Citizen" // {
        default = false;
      };

      steam.enable = mkEnableOption "Enable Steam" // {
        default = cfg.gaming.enable;
      };

      prism.enable = mkEnableOption "Enable Prism Launcher" // {
        default = cfg.gaming.enable;
      };
    };

    tooling = {
      enable = mkEnableOption "Enable development tooling";

      java.enable = mkEnableOption "Enable Java tooling" // {
        default = cfg.tooling.enable;
      };

      nix.enable = mkEnableOption "Enable Nix tooling" // {
        default = cfg.tooling.enable;
      };

      rust.enable = mkEnableOption "Enable Rust tooling" // {
        default = cfg.tooling.enable;
      };

      typst.enable = mkEnableOption "Enable Typst tooling" // {
        default = cfg.tooling.enable;
      };
    };
  };
}
