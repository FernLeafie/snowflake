{ inputs, pkgs, ... }: 
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    autoEnable = true;
  };
}
