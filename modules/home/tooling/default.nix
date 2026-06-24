{ lib, ... }:
{
  imports =
    [
      ./java.nix
      ./nix.nix
      ./rust.nix
      ./typst.nix
    ];
  snow.tooling.nix.enable = lib.mkDefault true;
}
