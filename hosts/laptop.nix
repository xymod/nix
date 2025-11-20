{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix        # конфиг разделов диска и файловых систем
    ./modules/users.nix                 # модуль пользователя
    ./modules/systemd-boot.nix          # модуль загрузчика systemd-boot
    ./modules/tty.nix                   # настройки tty шрифта, приветствия
    ./modules/network-iwd.nix           # только wi-fi
  ];

  programs.niri.enable = true;
  programs.nano.enable = false;
  networking.hostName = "nixos-laptop";
  system.stateVersion = "25.05";
  time.timeZone = "UTC";
}
