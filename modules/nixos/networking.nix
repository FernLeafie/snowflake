{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib.modules) mkForce;
in
{

  # Enable networking
  networking = {
    networkmanager.enable = true;

    # as opposed to using iptables for filtering
    # nftables.enable = true;
    # [WARN] off as enabling it for some reason messes up Minecraft LAN ports
    # don't understand why, would love to use it
    # seemingly neither should work without permission to the ports

    firewall = {
      enable = true; # true either way

      # firewall exception
      allowedTCPPorts = [
        25565 # Minecraft: good default server port
      ];
      allowedUDPPorts = [
        4445 # Minecraft: supposedly broadcasts server info
        # Minecraft: seemingly same as 4445 but for prism
        # only mentioned once in a random Markdown file on GitHub
        24454
      ];

      allowedTCPPortRanges = [ ];
      allowedUDPPortRanges = [ ];

      # might help with Tailscale exit nodes
      checkReversePath = mkForce false;
    };
  };
}
