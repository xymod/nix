{ config, pkgs, ... }:

{
  services.greetd = {
    #######################
    ### Общие настройки ###
    #######################
    enable = true;
    settings = {
      default_session = {
        user = "mod";
        command = ''
          ${pkgs.greetd.tuigreet}/bin/tuigreet \
          --time \
          --asterisks \
          --theme 'border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red' \
          --cmd niri-session
        '';
      };
    };
  };
}
