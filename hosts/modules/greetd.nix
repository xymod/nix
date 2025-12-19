{ config, pkgs, ... }:

{
  services.greetd = {
    #######################
    ### Общие настройки ###
    #######################
    enable = true;                                        # Включаем greetd

    ###################################
    ### Настройки tuigreet и сессии ###
    ###################################
    settings.default_session.command = ''
      ${pkgs.greetd.tuigreet}/bin/tuigreet \              # Запуск tui-версии greetd (tuigreet) — текстовый greeter
      --time \                                            # Показывать время
      --time-format "%d.%m.%Y %H:%M" \                    # Формат даты и времени
      --power-shutdown "systemctl poweroff" \             # Команда для выключения системы
      --power-reboot "systemctl reboot" \                 # Команда для перезагрузки системы
      --asterisks \                                       # Отображать звездочки при вводе пароля
      --theme 'border=blue;text=white;prompt=green;time=magenta;action=cyan;button=yellow;container=black;input=red' \
      --cmd niri-session                                  # Команда, которая запускается после логина
    '';
  };
}
