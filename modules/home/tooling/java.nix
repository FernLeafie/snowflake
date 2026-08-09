{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.tooling.java.enable {
    home.packages = with pkgs; [
      gradle
      jetbrains.idea
      jdt-language-server
      jdk21
    ];
    programs.nixvim = {
      lsp.servers.jdtls.enable = true;
    };
  };
}
