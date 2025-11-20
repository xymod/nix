{ config, lib, ... }:

{
  services.getty = {
    greetingLine = lib.mkForce "NixOS ${config.system.nixos.release} — \\l";
    helpLine = lib.mkForce "";
  };
  console = {
    enable = true;         # Включен по умолчанию, но пусть будет
    keyMap = "us";         # Раскладка клавиатуры
  };
}
