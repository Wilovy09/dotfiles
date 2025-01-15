{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host rpi
        HostName 192.168.1.15
        User admin
    '';
  };
}
