{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;              # Включено
    defaultKeymap = "viins";    # insert mode по умолчанию, Esc → normal mode
    enableCompletion = true;    # Автодополнение
    history = {
      append = true;            # Дописывать историю, а не перезаписывать
      share = true;             # Общий пул истории между сессиями
      saveNoDups = true;        # Не сохранять дубликаты
    };
    syntaxHighlighting = {
      enable = true;                            # Включено
      highlighters = [ "main" "brackets" ];     # Что подсвечивать
    };
  };
}
