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
      ${pkgs.greetd.tuigreet}/bin/tuigreet \
      --time \
      --time-format "%d.%m.%Y %H:%M" \
      --asterisks \
      --cmd niri-session \
      --theme 'border=blue;text=white;prompt=green;time=magenta;action=cyan;button=yellow;container=black;input=red'
    '';
  };
}

