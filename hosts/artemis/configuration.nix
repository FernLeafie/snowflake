{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos
    ./../../modules/shared
  ];

  # gift
  programs.nano.enable = false;

  snow = {
    programs.firefox.extraExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
      scriptcat
    ];
    gamedev.enable = true;
    gaming = {
      enable = true;
      # [NOTE] Disable millennium as the nov 11 steam update broke it
      # kept until millennium v3.6.3 releases
      steam.millennium.enable = false;
      star-citizen.enable = true;
    };
    graphical.enable = true;
    writing.enable = true;
    tooling = {
      c.enable = true;
      nix.enable = true;
      rust.enable = true;
      typst.enable = true;
    };
    user-services = {
      enable = true;
      proton-vpn.enable = true;
    };
    services.tailscale.enable = true;
  };

  # Define your hostname and location
  networking.hostName = "artemis";
  time.timeZone = "Europe/Stockholm";

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.fern-snowleafie = {
    isNormalUser = true;
    description = "Fern Snowleafie";
    extraGroups = [
      "wheel"
      "networkmanager"
    ]; # Enable ‘sudo’ for the user.
    shell = pkgs.fish;

    # should this be a secret? mayhaps, but it's not like it will be used outside build-vm either way
    initialHashedPassword = "$6$r7QyEAiR$LJe8XE2OfbpS8lJ.qGSSuQbjomvN8RLz/JovUpqmi77bd/29o3vMkYEMBd94mi2VWLKbtkbXcM96sbh0r/eKt1";
  };

  # Device specific settings
  hardware.ckb-next.enable = true; # Corsair keyboard driver
  services.hardware.openrgb.enable = true; # YIPPIE NO MORE RGB
  environment.systemPackages = with pkgs; [
    wine64
    (makeAutostartItem {
      name = "ckb-next";
      package = pkgs.ckb-next;
      appendExtraArgs = [ "--background" ];
    }) # also starts ckb-next, since without it lights dont apply
  ];
  fonts.packages = with pkgs; [
    vollkorn
  ];
}
