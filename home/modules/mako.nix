{ config, pkgs, lib, ... }:

{
  services.mako = {
    enable = true;                         # Включаем mako
    settings = {
      max-history = 20;                    # Сколько хранить записей в истории
      background-color = "#24283bee";      # Цвет фона
      text-color = "#c0caf5ff";            # Цвет текста
      border-size = 1;                     # Размер рамки
      border-color = "#7aa2f7ff";          # Цвет рамки
      border-radius = 8;                   # Скругление краев
      icons = 1;                           # Включение иконок
      ignore-timeout = 1;                  # Игнор приложения, используем 'default-timeout'
      default-timeout = 5000;              # Время показа в мс приложением
      max-visible = 4;                     # Максимум одновременных уведомлений на экране
    };
  };

  home.packages = with pkgs; [
    libnotify
  ];
}
