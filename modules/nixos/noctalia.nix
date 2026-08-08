{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ddcutil
  ];
  hardware.i2c.enable = true; # needed for ferns monitors
}
