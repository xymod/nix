{ config, pkgs, ... }:

{
  users = {
    allowNoPasswordLogin = false;             # Оставляем проверку, что есть возможность войти по паролю или SSH-ключу админу
    defaultUserHome = "/home";                # Директория для обычного пользователя по умолчанию
    defaultUserShell = pkgs.bash;             # Оболочка по умолчанию
    mutableUsers = false;                     # Все пользователи и группы ТОЛЬКО через конфиг
    users = {
      mod = {                                 # Имя пользователя mod
        enable = true;                        # Включаем пользователя
        isNormalUser = true;                  # Обычный пользователь, не системный
        createHome = true;                    # Создаем домашнюю директорию с правильными правами
        home = "/home/mod";                   # Путь домашней директории (не обязательно)
        homeMode = "700";                     # Права на домашнюю директорию только для пользователя
        extraGroups = [ "wheel" ];            # Даем права sudo
        useDefaultShell = true;               # Использовать оболочку по умолчанию
        password = "123";                     # TODO sops
        openssh.authorizedKeys.keys = [       # Публичный SSH-ключ
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIB7Tz/5egH9CNwVK30Mq6fvvrxD8y/DIMV7ty/lcgxt"
        ];
      };
    };
  };
}
