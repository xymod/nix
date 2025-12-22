{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "mod";
    userEmail = "dmitrii@example.com";
    signing = {
      format = "ssh";                  # Метод подписи коммитов и тегов
      signByDefault = true;            # Подписывать все коммиты и теги по умолчанию
      key = "/run/media/mod/SecureVault/.ssh/github";   # Путь к приватному ключу
    };
    extraConfig = ''
      [core]
      sshCommand = "ssh -i /run/media/mod/SecureVault/.ssh/github -F /dev/null";
      [url "git@github.com:xymod/"]
      insteadOf = "https://github.com/xymod/"
    '';
  };
}
