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
    ];
    programs.nixvim = {
      lsp.servers.jdtls.enable = true;
    };
  };
}
