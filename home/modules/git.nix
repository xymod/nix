{ config, pkgs, lib, ... }:

{
  programs.git = {
    #######################
    ### Общие настройки ###
    #######################
    enable = true;                                      # Включаем git
    userName = "mod";                                   # Имя пользователя
    userEmail = "mod@example.com";                      # Почта пользователя
    #######################
    ###     Подпись     ###
    #######################
    signing = {
      format = "ssh";                                   # Метод подписи коммитов и тегов
      signByDefault = true;                             # Подписывать все коммиты и теги по умолчанию
      key = "/run/media/mod/SecureVault/.ssh/github";   # Путь к приватному ключу
    };
    #######################
    ###  Доп настройки  ###
    #######################
    extraConfig = ''
      [core]
      sshCommand = "ssh -i /run/media/mod/SecureVault/.ssh/github -F /dev/null";
      [url "git@github.com:xymod/"]
      insteadOf = "https://github.com/xymod/"
    '';
  };
}
