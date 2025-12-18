{ config, pkgs, lib, ... }:

{
  services.udiskie = {
    enable = true;                  # Включаем udiskie
    automount = true;               # Включаем автомонтирование флешек
    notify = true;                  # Включаем показ всплывающих уведомлений
  };
}
