{ config, lib, pkgs, ... }:
{
  options = {
    snow.tooling.rust.enable =
      lib.mkEnableOption "rust tooling";
  };
  config = lib.mkIf config.snow.tooling.rust.enable {
    home.packages = with pkgs; [
      rust-bin
      rust-analyzer-unwrapped
      cargo
    ];
  };
}
