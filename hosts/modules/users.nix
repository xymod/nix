{ config, pkgs, ... }:

{
  users.users.mod = {           # Имя пользователя mod
    enable = true;              # Включаем пользователя
    isNormalUser = true;        # Обычный пользователь, не системный
    createHome = true;          # Создаем домашнюю директорию с правильными правами
    extraGroups = [ "wheel" ];  # Даем права sudo
    home = "/home/mod";         # Путь домашней директории
    homeMode = "700";           # Права на домашнюю директорию только для пользователя
    hashedPassword = "";        # TODO: решить вопрос с паролем
  };
}
