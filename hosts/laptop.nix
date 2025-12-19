{ config, lib, pkgs, ... }:

{
  #######################
  ### Модули системы  ###
  #######################
  imports = [
    ./modules/hardware-laptop.nix       # Настройки железа
    ./modules/users.nix                 # Пользователеи, группы, права
    ./modules/systemd-boot.nix          # UEFI загрузчик systemd-boot
    ./modules/tty.nix                   # TTY: шрифт, приветствие, автологин
    ./modules/network-iwd.nix           # Wi-Fi
    ./modules/greetd.nix
  ];

  #######################
  ### Общие настройки ###
  #######################
  networking.hostName = "nixos-laptop";                              # Имя хоста системы
  system.stateVersion = "25.05";                                     # Версия NixOS (НЕ обновлять без причины)
  time.timeZone = "UTC";                                             # Часовой пояс
  nix.settings.experimental-features = [ "nix-command" "flakes" ];   # Включаем flakes и nix-command
  #xdg.portal.enable = false;                                         #

  #######################
  ###     Утилиты     ###
  #######################
  environment.systemPackages = with pkgs; [ 
    brightnessctl                                                    # Управление яркостью экрана
  ];

  #######################
  ###    Программы    ###
  #######################
  programs = {
    niri.enable = true;                                              # Включаем Wayland-композитор niri
    nano.enable = false;                                             # Отключаем nano (используем другой редактор)
  };

  #######################
  ###    Сервисы      ###
  #######################
  services = {
    udisks2.enable = true;                                           # Включаем автомонтирование съёмных носителей
  };
}
