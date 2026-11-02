{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # completion
    ./pairs.nix
    # LSP
    ./completions.nix
    ./debugging.nix
    ./diagnostics.nix
    ./formatting.nix
    ./lsp.nix
    ./schema.nix
    # UI
    ./catppuccin.nix
    ./filetree
    ./greeter.nix
    ./notifications.nix
    ./statusline.nix
    ./tabline.nix
    ./telescope.nix
    ./themeing.nix
    # utils;
    ./colouriser.nix
    ./folding.nix
    ./harpoon.nix
    ./treesitter-context.nix
    ./whick-key.nix
    # syntax
    ./treesitter.nix
  ];

  plugins = {
    blink-indent.enable = true;
    comment.enable = true;
    gitsigns.enable = true;
    indent-o-matic.enable = true;
  };
  extraPlugins = with pkgs.vimPlugins; [
    nvim-numbertoggle
  ];
}
