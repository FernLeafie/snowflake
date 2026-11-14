{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  cfg = osConfig.snow.tooling.c-sharp;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dotnet-sdk_10
    ];
    programs.nixvim = {
      lsp.servers.csharp_ls.enable = true;
      plugins.conform-nvim.settings.formatters_by_ft = {
        cs = [
          "csharpier"

        ];
      };
    };
  };
}
