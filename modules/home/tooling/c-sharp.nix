{
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.snow.tooling.c-sharp.enable {
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
