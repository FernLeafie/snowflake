{ lib, ... }:
{
  imports = [
    ./star-citizen.nix
    ./steam.nix
  ];

  options = {
    snow.gaming.enable =
      lib.mkEnableOption "gaming preset" // {
        default = false;
      };
  };
}
