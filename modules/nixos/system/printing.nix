{ config, lib, pkgs, ... }:
{
  # Enable CUPS to print documents.
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        # Network discovery
        cups-filters
        cups-browsed

        # Printer drivers
        gutenprint
        hplip
        # hplipWithPlugin
        hp-unified-linux-driver
        cups-pdf-to-pdf
      ];
    };

    # Network printing
    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
      openFirewall = true;
    };

    # USB printing
    ipp-usb.enable = true;
  };
}
