{ config, pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;              # Включено
    enableCompletion = true;    # Автодополнение через TAB
    shellAliases = {
      ls = "ls --group-directories-first";
    };
    historyControl = [ 
      "erasedups"               # Удалять все предыдущие дубликаты
      "ignoredups"              # Не сохраняет, если команда совпадает с предыдущей
      "ignorespace"             # Не сохранять в историю команды, которые начинаются с пробела
    ];
    shellOptions = [
      "histappend"       # Добавлять историю в файл, а не перезаписывать
      "checkwinsize"     # После каждой команды проверять размер терминала и обновлять LINES и COLUMNS
      "extglob"          # Включает “расширенные” шаблоны (*.@(ext|ext2), !(…) и т.п.)
      "globstar"         # ** соответствует папкам и под‑папкам (рекурсивный glob)
      "cmdhist"          # Многострочные команды сохранять как одну запись в истории
      "checkjobs"        # Проверять фоновые задания перед выходом из сессии
    ];
    initExtra = ''
    # Сохраняем текущую git‑ветку, если есть
    export PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
    # Устанавливаем PS1
    export PS1='\[\e[30;48;5;41m\]\u\[\e[0;48;5;39m\] \[\e[30m\]\H\[\e[39m\] \[\e[48;5;220m\] \[\e[30m\]\w\[\e[39m\] \[\e[30;48;5;200m\]${PS1_CMD1}\[\e[0m\] '
    '';
  };
}
