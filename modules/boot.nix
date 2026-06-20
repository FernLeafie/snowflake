{ inputs, pkgs, ... }:
{
  boot = {
    plymouth = {
      enable = true;
    };

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      # grub.enable = true;
      # grub.useOSProber = true;
      # grub.device = "/dev/nvme0n1";
    };
  };
}
