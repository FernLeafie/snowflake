{ config, lib, pkgs, ... }:
{
  options = {
    snow.tooling.java.enable =
      lib.mkEnableOption "java tooling" // {
        default = config.snow.tooling.enable;
      };
  };
  config = lib.mkIf config.snow.tooling.java.enable {
    home.packages = with pkgs; [
      gradle
      jetbrains.idea
      jdt-language-server
    ];
  };
  programs.nixvim = {
    lsp.servers.jdtls.enable = true;
  };
}
