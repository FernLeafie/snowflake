{
  inputs,
  config,
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  programs.rmpc = {
    enable = true;
    config = builtins.readFile ./rmpc-config.ron;
    package = inputs.rmpc.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
  xdg.configFile."rmpc/themes/custom.ron".text = builtins.readFile ./rmpc-theme.ron;

  home.packages = [
    inputs.rmpc.packages.${pkgs.stdenv.hostPlatform.system}.rmpcd
    pkgs.playerctl
  ];
  xdg.configFile."rmpcd/init.lua".text = builtins.readFile ./rmpcd-init.lua;

  services = {
    playerctld.enable = true;
    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
        audio_output {
          type "fifo"
          name "my_fifo"
          path "/tmp/mpd.fifo"
          format "44100:16:2"
        }
      '';
    };
  };
}
