{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    signing = {
      format = "ssh";                  # Метод подписи коммитов и тегов
      signByDefault = true;            # Подписывать все коммиты и теги по умолчанию
      key = "/media/usb/ssh/github";   # Путь к приватному ключу
    };
  };
}
