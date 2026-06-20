{ inputs, pkgs, ... }:
{
  boot = {
    # plymouth = {
    #   enable = true;
    #   theme = "bgrt";
    # };
    #
    # initrd.systemd.enable = true;
    #
    # # Enable "Silent boot"
    # consoleLogLevel = 3;
    # initrd.verbose = false;
    # kernelParams = [
    #   "quiet"
    #   "splash"
    #   "rd.udev.log_level=3"
    #   "rd.systemd.show_status=auto"
    # ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      # grub.enable = true;
      # grub.useOSProber = true;
      # grub.device = "/dev/nvme0n1";
    };
  };
}
