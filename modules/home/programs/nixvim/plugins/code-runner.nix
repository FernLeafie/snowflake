{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "code-runner";
      src = pkgs.fetchFromGitHub {
        owner = "CRAG666";
        repo = "code_runner.nvim";
        rev = "ae11f6cb469ee5547cd0e076ecb41d74a7322cb8";
        hash = "sha256-BTd5gQgocJNygy2BeLHNxBnWl1kVsNAzFFG4Y0ucuJM=";
      };
    })
  ];

  extraConfigLua = ''
    require("code_runner").setup({
      mode = "float",
      startinsert = true,
      float = {
        border = "rounded";
      },
      filetype = {
        c = { "cd $dir && clang $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt" },
      },
    })
  '';

  keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>cr";
      action.__raw = "require('code_runner').run_code";
      options.desc = "Code runner";
    }
  ];
}
