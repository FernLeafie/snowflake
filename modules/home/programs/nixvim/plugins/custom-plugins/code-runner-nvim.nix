{ lib, ... }:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "code-runner-nvim";
  package = "code-runner-nvim"; # not yet packaged
  description = ''
    Blazing fast Code Runner for Neovim written in pure lua
  ''; # is what the program itself says
  url = "https://github.com/CRAG666/code_runner.nvim";

  maintainers = with lib.maintainers; [ FernLeafie ];

  moduleName = "code_runner";
  settingsExample = {
    mode = "float";
    startinsert = true;
    float = {
      border = "rounded";
    };
    filetype = {
      java = [
        "cd $dir &&"
        "javac $fileName &&"
        "java $fileNameWithoutExt"
      ];
      python = "python3 -u";
      typescript = "deno run";
      rust = [
        "cd $dir &&"
        "rustc $fileName &&"
        "$dir/$fileNameWithoutExt"
      ];
    };
  };
}
