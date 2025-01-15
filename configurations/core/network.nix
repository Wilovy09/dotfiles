{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [22];
  time.timeZone = "America/Monterrey";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
}
