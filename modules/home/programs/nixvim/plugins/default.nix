{ inputs, config, lib, pkgs, ... }:
{
  imports = [
    # completion
    ./pairs.nix
    # LSP
    ./completions.nix
    ./formatting.nix
    ./debugging.nix
    ./diagnostics.nix
    ./lsp.nix
    # UI
    ./catppuccin.nix
    ./filetree.nix
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
    comment.enable = true;
    blink-indent.enable = true;
    gitsigns.enable = true;
  };
  extraPlugins = with pkgs.vimPlugins; [
    nvim-numbertoggle
  ];
}
