{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;              # Включено
    defaultKeymap = "viins";    # insert mode по умолчанию, Esc → normal mode
    enableCompletion = true;    # Автодополнение
    
    # История
    history = {
      append = true;            # Дописывать историю, а не перезаписывать
      share = true;             # Общий пул истории между сессиями
      saveNoDups = true;        # Не сохранять дубликаты
    };

    # Подсветка синтаксиса
    syntaxHighlighting = {
      enable = true;                            # Включено
      highlighters = [ "main" "brackets" ];     # Что подсвечивать
    };

    # Автоподсказкии по истории
    autosuggestion = {
      enable = true;                            # Включено
      highlight =  "fg=#00ffff";                # Стиль автоподсказок
    };
  };
}
