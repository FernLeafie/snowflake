{ config, lib, pkgs, osConfig, ... }:
{
  plugins = {
    lspconfig.enable = true;
    fidget = {
      enable = true;
      settings = {
        # [WARN] somehow fails to load if present
        # notification.window.avoid = [ "NvimTree" ];
      };
    };
  };

  lsp.servers = {
    harper_ls = {
      enable = true;
      config = {
        linters = {
          SentenceCapitalization = false;
        };
        dialect = "British";
      };
    };
    nixd = {
      config =
        let
          flake = ''(builtins.getFlake "github:FernLeafie/snowflake)""'';
        in
        {
          nixpkgs = {
            expr = "import <nixpkgs> { }";
          };
          formatting.command = [ "nixfmt" ];
          options = {
            nixos = {
              # expr = ''(builtins.getFlake "${config.home.homeDirectory}/snowflake").nixosConfigurations.${config.networking.hostName}.options'';
              # [TODO] make this actually use the right networking name
              expr = ''${flake}.nixosConfigurations.aphrodite.options'';
            };
          };
        };
    };
  };
  keymaps = [
    {
      mode = [ "n" ];
      key = "K";
      action = {
        __raw = ''
          function()
          	vim.lsp.buf.hover({ border = 'rounded' })
          end
        '';
      };
      options.desc = "Show LSP hover information";
    }
  ];
}
