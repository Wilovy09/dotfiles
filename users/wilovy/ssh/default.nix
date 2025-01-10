{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host rb3b
        HostName 192.168.1.15
        User wilovy
    '';
  };
}
