{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./fastfetch
    ./hyfetch
    ./nixvim
  ];

  programs = {
    lazygit = {
      enable = true;
      settings = {
        git.diffRenderers = [
          {
            command = "${pkgs.delta}/bin/delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format='lazygit-edit://{path}:{line}'";
          }
        ];
      };
    };
    delta = {
      enable = true;
      enableGitIntegration = true;
    };
    bottom = {
      enable = true;
      settings = {
        styles.widgets.widget_border_type = "rounded";
      };
    };
    yazi = {
      enable = true;
      settings = {
        mgr = {
          sort_by = "natural";
        };
      };
      # [FIXME] conflicts with Catppuccins theming
      # theme = lib.mkForce {
      #     dirs = [
      #       { name = ".config"; text = ""; }
      #       { name = ".git"; text = ""; }
      #       { name = ".github"; text = ""; }
      #       { name = ".npm"; text = ""; }
      #       { name = "Applications"; text = ""; }
      #       { name = "Books"; text = ""; }
      #       { name = "Desktop"; text = ""; }
      #       { name = "Development"; text = ""; }
      #       { name = "Documents"; text = "󱔘"; }
      #       { name = "Downloads"; text = ""; }
      #       { name = "Games"; text = "󰺵"; }
      #       { name = "Library"; text = ""; }
      #       { name = "Movies"; text = ""; }
      #       { name = "Music"; text = ""; }
      #       { name = "Pictures"; text = ""; }
      #       { name = "Public"; text = ""; }
      #       { name = "Sync"; text = ""; }
      #       { name = "Videos"; text = ""; }
      #     ];
      #     files = [
      #       { name = "avif"; text = ""; fg = "#7f849c"; }
      #       { name = "3gp"; text = ""; fg = "#fab387"; }
      #       { name = "bmp"; text = ""; fg = "#7f849c"; }
      #       { name = "ebook"; text = ""; fg = "#fab387"; }
      #       { name = "jpg"; text = ""; fg = "#7f849c"; }
      #       { name = "webm"; text = ""; fg = "#fab387"; }
      #       { name = "gif"; text = ""; fg = "#7f849c"; }
      #       { name = "webp"; text = ""; fg = "#7f849c"; }
      #       { name = "mobi"; text = ""; fg = "#fab387"; }
      #       { name = "mov"; text = ""; fg = "#fab387"; }
      #       { name = "mp4"; text = ""; fg = "#fab387"; }
      #       { name = "png"; text = ""; fg = "#7f849c"; }
      #       { name = "pdf"; text = ""; fg = "#585b70"; }
      #       { name = "ico"; text = ""; fg = "#f9e2af"; }
      #       { name = "jxl"; text = ""; fg = "#7f849c"; }
      #       { name = "jpeg"; text = ""; fg = "#7f849c"; }
      #       { name = "m4v"; text = ""; fg = "#fab387"; }
      #       { name = "cast"; text = ""; fg = "#fab387"; }
      #       { name = "mkv"; text = ""; fg = "#fab387"; }
      #       { name = "epub"; text = ""; fg = "#fab387"; }
      #       { name = "cb7"; text = ""; fg = "#fab387"; }
      #       { name = "cba"; text = ""; fg = "#fab387"; }
      #       { name = "cbr"; text = ""; fg = "#fab387"; }
      #       { name = "cbt"; text = ""; fg = "#fab387"; }
      #       { name = "cbz"; text = ""; fg = "#fab387"; }
      #       { name = "xyz"; text = ""; fg = "#f5e0dc"; }
      #       { name = "bbmodel"; text = ""; fg = "#74c7ec"; }
      #     ];
      #     conds = [
      #       { "if" = "dir"; text = ""; }
      #       { "if" = "exec"; text = ""; }
      #       { "if" = "!dir"; text = ""; }
      #     ];
      #   };
    };
  };
}
