{ ... }:
{
  programs.niri = {
    config = builtins.readFile ./niri.kdl;
  };
}
