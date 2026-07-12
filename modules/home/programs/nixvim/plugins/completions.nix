{
  config,
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          preset = "default";
          "<CR>" = [
            "accept"
            "fallback"
          ];
        };
        signature = {
          enabled = true;
          window.border = "rounded";
        };
        completion = {
          ghost_text.enabled = true;
          menu = {
            border = "rounded";
            draw = {
              treesitter = [ "lsp" ];
              columns = [
                {
                  __unkeyed-1 = "kind_icon";
                  __unkeyed-2 = "label";
                  __unkeyed-3 = "label_description";
                  gap = 1;
                }
                [ "kind" ]
              ];
            };
          };
          documentation = {
            auto_show = true;
            window.border = "rounded";
          };
        };
      };
    };
    friendly-snippets.enable = true;
    # [NOTE] not currently needed, but could be enabled in the future
    # luasnip = {
    #   enable = true;
    #   fromVscode = [{ }];
    # };
  };
}
