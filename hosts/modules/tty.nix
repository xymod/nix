{ config, lib, ... }:

{
  console = {
    #######################
    ### Общие настройки ###
    #######################
    enable = true;         # Включаем console (TTY)
    earlySetup = true;     # Включаем раннюю настройку консоли в initrd
    keyMap = "us";         # Раскладка клавиатуры

    ########################
    ### Цветовая палитра ###
    ########################
    colors = [
      "1a1b26"             # 0 - Black (фон)
      "f7768e"             # 1 - Red
      "9ece6a"             # 2 - Green
      "e0af68"             # 3 - Yellow
      "7aa2f7"             # 4 - Blue
      "bb9af7"             # 5 - Magenta
      "7dcfff"             # 6 - Cyan
      "c0caf5"             # 7 - White (текст)
      "414868"             # 8 - Bright Black
      "f7768e"             # 9 - Bright Red
      "9ece6a"             # 10 - Bright Green
      "e0af68"             # 11 - Bright Yellow
      "7aa2f7"             # 12 - Bright Blue
      "bb9af7"             # 13 - Bright Magenta
      "7dcfff"             # 14 - Bright Cyan
      "c0caf5"             # 15 - Bright White
    ];
  };

  #######################
  ###  Логин по TTY   ### 
  #######################
  #services.getty = {
  #  greetingLine = lib.mkForce "NixOS ${config.system.nixos.release} - \l";    # Выводим сообщение о канале NixOS и номере tty
  #  helpLine = lib.mkForce "";                                                 # Убираем helpline
  #};
}
