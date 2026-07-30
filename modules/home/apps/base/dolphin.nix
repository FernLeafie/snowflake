{ config, pkgs, ... }:
{
  xdg.configFile."kdeglobals".text = ''
    [General]
    TerminalApplication=kitty
    TerminalService=kitty.desktop

    [Icons]
    Theme=Papirus-Dark
  '';
}
