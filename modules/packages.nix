{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    kitty
    niri
    fastfetch
    fish
    jq
    neovim
    tree-sitter
    chafa
    gcc
    ripgrep
    thunderbird
    cargo
    discord
    # nil
    # nixpkgs-fmt
    prismlauncher
  ];

  fonts.packages = with pkgs; [
    maple-mono.NF-CN
  ];
  programs.firefox.enable = true;
  programs.fish.enable = true;
}
