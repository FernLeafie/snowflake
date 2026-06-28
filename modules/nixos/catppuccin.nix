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
    plymouth.enable = false;
  };
}
