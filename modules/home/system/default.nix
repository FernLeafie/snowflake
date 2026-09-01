{
  imports = [
    ./keyboard.nix
    ./niri
    ./noctalia
  ];
  # Compatibility layer between X11 trays and status notifier trays (mainly for wine);
  services.xembed-sni-proxy.enable = true;
}
