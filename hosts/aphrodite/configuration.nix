{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./../../modules/nixos
    ];

  # Define your hostname and location
  networking.hostName = "aphrodite";
  time.timeZone = "Europe/Stockholm";

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.fern-snowleafie = {
    isNormalUser = true;
    description = "Fern Snowleafie";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };
}
