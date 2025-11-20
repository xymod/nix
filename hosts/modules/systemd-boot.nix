{ config, pkgs, ... }:

{
  boot = {
    consoleLogLevel = 0;                  # Уровень логирования - только критические сообщения
    kernelParams = [
      "quiet"                             # Тихий режим загрузки
      "udev.log_level=3"
    ];
    initrd = {
      verbose = false;                    # Не выводить детальные сообщения при сборке initrd
      kernelModules = [ "i915" ];         # Загружаем сразу драйвер видео (чтобы не было мерцаний)
    };
    loader = {
      timeout = 0;                        # Длительность показа консоли (для показа удерживать любую клавишу)
      systemd-boot = {                    # Определяем какой загрузчик
        enable = true;                    # Включаем загрузчик systemd-boot
        editor = false;                   # Отключаем редактирование командной строки ядра перед загрузкой
        configurationLimit = 30;          # Сколько поколений отображается при загрузке
        consoleMode = "max";              # ставим максимальное разрешение консоли
      };
      efi.canTouchEfiVariables = true;    # Разрешаем NixOS управлять EFI-загрузочными записями
    };
  };
}
