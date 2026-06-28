{ lib, ... }:
{
  imports = [
    ./steam.nix
  ];

  options = {
    snow.gaming.enable =
      lib.mkEnableOption "gaming preset" // {
        default = false;
      };
  };
}
