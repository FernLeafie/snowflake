{ inputs, pkgs, ... }:
{
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    autoEnable = true;
  };
  catppuccin = {
    # [NOTE] enable this once the cache behaves better catppuccin/nix#1058
    # or resort to overwriting whiskers with the nixpkgs one catppuccin/nix#1012
    # or hope upstream decides to fix it catppuccin/nix#1052
    # cache.enable = true;
    plymouth.enable = false;
  };
}
