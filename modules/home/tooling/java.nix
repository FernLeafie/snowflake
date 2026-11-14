{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.tooling.java;
in
{
  config = mkIf cfg.enable {
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
