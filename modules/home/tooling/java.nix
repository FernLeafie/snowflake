{ config, lib, pkgs, ... }:
{
  options = {
    snow.tooling.java.enable =
      lib.mkEnableOption "java tooling";
  };
  config = lib.mkIf config.snow.tooling.java.enable {
    home.packages = with pkgs; [
      gradle
      jetbrains.idea
      jdt-language-server
    ];
  };
}
