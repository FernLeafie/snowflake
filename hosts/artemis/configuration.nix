{ config, lib, pkgs, ... }:
{
  imports =
    [
      # ./hardware-configuration.nix
      ./../../modules/nixos
    ];

  snow.gaming.steam.enable = true;

  # Define your hostname and location
  networking.hostName = "artemis";
  time.timeZone = "Europe/Stockholm";

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.fern-snowleafie = {
    isNormalUser = true;
    description = "Fern Snowleafie";
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;
  };
}
