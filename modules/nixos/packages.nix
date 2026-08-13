{
  config,
  lib,
  pkgs,
  ...
}:
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
    gcc
    ripgrep
    thunderbird
    cargo
    # nil
    # nixpkgs-fmt
    nfs-utils
  ];

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    maple-mono.NF-CN
  ];
  programs.firefox.enable = true;
  programs.fish.enable = true;
}
