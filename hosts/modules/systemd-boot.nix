{ config, pkgs, ... }:

{
  boot = {
    consoleLogLevel = 0;                  # Выводить в консоль при загрузке только критичные сообщения
    loader = {
      timeout = 3;                        # Длительность показа консоли
      systemd-boot = {                    # Определяем какой загрузчик
        enable = true;                    # Включаем загрузчик systemd-boot
        editor = false;                   # Отключаем редактирование командной строки ядра перед загрузкой
        configurationLimit = 20;          # Сколько поколений отображается при загрузке
        consoleMode = "max";              # ставим максимальное разрешение консоли
      };
      efi.canTouchEfiVariables = true;    # Разрешаем NixOS управлять EFI-загрузочными записями
    };
  };
}
