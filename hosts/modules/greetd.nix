{ config, pkgs, ... }:

{
  services.greetd = {
    #######################
    ### Общие настройки ###
    #######################
    enable = true;
    settings = {
      default_session = {
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \                                         # Показывать время
          --asterisks \                                    # Показывать звездочки при вводе пароля
          --cmd niri-session                               # Команда, которая запускается после логина
          --theme 'border=blue;text=white;prompt=green;time=magenta;action=cyan;button=yellow;container=black;input=red' \
        '';
      };
    };
  };
}
