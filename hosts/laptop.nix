{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix        # конфиг разделов диска и файловых систем
    ./modules/users.nix                 # модуль пользователя
    ./modules/systemd-boot.nix          # модуль загрузчика systemd-boot
    ./modules/tty.nix                   # настройки tty шрифта, приветствия
  ];

  networking.hostName = "nixos-laptop";
  system.stateVersion = "25.05";
  time.timeZone = "UTC";
}
