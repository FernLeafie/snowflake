{ config, lib, pkgs, ... }:
{
  imports = [
    ./fastfetch
  ];

  programs = {
    lazygit = {
      enable = true;
      settings = {
        git.pagers = [
          { pager = "${pkgs.delta}/bin/delta --dark --paging=never --line-numbers --hyperlinks --hyperlinks-file-link-format='lazygit-edit://{path}:{line}'"; }
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
  };
}
