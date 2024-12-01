{ config, lib, pkgs, ... }:
{
  xdg.configFile = {
    "openbox/rc.xml".source = ./rc.xml;
    "openbox/menu.xml".source = ./menu.xml;
    "openbox/autostart".source = ./autostart;
  };
}
