{
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host nixpi
        HostName 192.168.1.15
        User admin
    '';
  };
}
