{ config, pkgs, ... }:

{
  # Настройка SSH-сервера
  services.openshh = {
    enable = true;                               # Включить SSH-сервер
    package = programs.ssh.package;              # Какой пакет использовать
    ports = [ 58585 ];                           # На каком порту SSH
    openFirewall = false;                        # Открываем сами через firewall (не тут)
    startWhenNeeded = false;                     # Сервер всегда работает (не по требованию)
    sftpServerExecutable = "internal-sftp";      # Используем встроенный SFTP
    settings = {
      X11Forwarding = false;                     # Без передачи графики
      UsePAM = true;                             # Доступ к 2FA аутентификации после SSH-ключа
      UseDns = false;                            # Не проверять DNS (быстрее и безопаснее)
      StrictModes = true;                        # Не пускать, если .ssh открыт другим (права)
      PrintMotd = false;                         # Не показывать приветствие после входа
      PermitRootLogin = "no";                    # Запрет для root по SSH
      PasswordAuthentication = false;            # Запретить вход по паролям (только ключи)
      LogLevel = "INFO";                         # Уровень логирования
      KbdInteractiveAuthentication = true;       # Разрешаем интерактивный ввод (для 2FA)
      GatewayPorts = "no";                       # Туннели доступны только внутри SSH-сессии
  # TODO: настроить 2FA после ssh-ключа
    };
}
