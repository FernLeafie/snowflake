{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    # ./hardware-configuration.nix
    ./../../modules/nixos
    ./../../modules/shared
  ];

  snow = {
    profiles.server.enable = true;

    services.tandoor.enable = true;
  };

  # Define your hostname and location
  networking.hostName = "hermes";
  time.timeZone = "Europe/Stockholm";

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.snowleafies = {
    isNormalUser = true;
    description = "Snowleafies";
    extraGroups = [
      "wheel"
      "networkmanager"
      "samba"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;

    # should this be a secret? mayhaps, but it's not like it will be used outside build-vm either way
    initialHashedPassword = "$6$r7QyEAiR$LJe8XE2OfbpS8lJ.qGSSuQbjomvN8RLz/JovUpqmi77bd/29o3vMkYEMBd94mi2VWLKbtkbXcM96sbh0r/eKt1";
  };
}

