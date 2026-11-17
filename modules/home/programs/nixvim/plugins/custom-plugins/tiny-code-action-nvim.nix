{ lib, pkgs, ... }:
lib.nixvim.plugins.mkNeovimPlugin {
  name = "tiny-code-action-nvim";
  package = "tiny-code-action-nvim";
  description = ''
    A Neovim plugin that provides a simple way to run and visualize code actions.
  '';
  url = "https://github.com/rachartier/tiny-code-action.nvim/";

  maintainers = with lib.maintainers; [ FernLeafie ];

  moduleName = "tiny-code-action";
  settingsExample = {
    backend = "delta";
    picker = "telescope";
    backend_opts = {
      delta = {
        header_lines_to_remove = 4;
        args = [
          "--line-numbers"
        ];
      };
    };
  };

  # This is mostly for my own setup, this should probably be done dynamically in an actual module
  extraPackages = with pkgs; [
    delta
  ];
}
