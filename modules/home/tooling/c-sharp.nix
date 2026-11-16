{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (lib.meta) getExe;
  cfg = osConfig.snow.tooling.c-sharp;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      dotnet-sdk_10
    ];
    programs.nixvim = {
      lsp.servers.csharp_ls.enable = true;
      plugins = {
        code-runner-nvim.settings.filetype.cs = [
          "cd $dir &&"
          "${getExe pkgs.dotnet-sdk_10} $fileName"
        ];
        conform-nvim.settings.formatters_by_ft = {
          cs = [
            "csharpier"
          ];
        };
      };
    };
  };
}
