{ lib, ... }:
{
  imports =
    [
      ./java.nix
      ./nix.nix
      ./rust.nix
      ./typst.nix
    ];

  options = {
    snow.tooling.enable =
      lib.mkEnableOption "all programming language tooling" // {
        default = false;
      };
  };

  config = {
    snow.tooling.nix.enable = lib.mkDefault true;
  };
}
