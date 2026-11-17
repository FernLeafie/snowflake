{
  lib,
  pkgs,
  osConfig,
  ...
}:
let
  inherit (lib.modules) mkIf;
  inherit (lib.meta) getExe;
  cfg = osConfig.snow.tooling.rust;
in
{
  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      rust-analyzer
      rustc
      cargo
    ];
    programs.nixvim = {
      snow.debugging = true;
      lsp.servers.rust_analyzer.enable = true;
      plugins = {
        code-runner-nvim.settings.filetype.rust = [
          "cd $dir &&"
          "${getExe pkgs.rustc} $fileName -o /tmp/$fileNameWithoutExt &&"
          "/tmp/$fileNameWithoutExt"
          # [NOTE] could just run $dir/$fileNameWithoutExt
          # but now we don't leave anything in the actual folder
        ];
      };
    };
  };
}
