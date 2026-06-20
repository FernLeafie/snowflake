{ inputs, config, pkgs, ... }:
{
  # imports = [
  #   inputs.catppuccin.homeModules.catppuccin
  # ];
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };
  catppuccin.kvantum.apply = true;
  gtk = {
    enable = true;
    font = {
      package = pkgs.maple-mono.NF-CN;
      name = "Maple Mono NF CN";
    };
  };
}
