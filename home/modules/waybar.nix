{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
	style = ''
	  * { all: unset; }
      /* Общее для всех */
      window#waybar {
        font-family: "IosevkaTerm NF Light";
        font-size: 14px;
        color: #E9E9E9;
      }
	  /* Верхний бар */
	  window#waybar.top {
    	background: rgba(32, 32, 32, 0.99);
	  }
	  /* Модули верхнего бара */
	  window#waybar.top .modules-left {
        padding-left: 5px;
	  }
	  window#waybar.top .modules-right {
        padding-right: 5px;
	  }
	  /* Цвета состояний */
	  #cpu.medium,
	  #battery.medium,
	  #network.disconnected,
	  #memory.medium { color: yellow; }

	  #cpu.high,
	  #memory.high { color: blue; }

	  #cpu.critical,
	  #battery.critical,
	  #temperature.critical,
	  #network.disabled,
	  #memory.critical { color: #ff3b2f; }
	'';

    settings = {
      mainBar = {
        position = "top";
        height = 20;
		spacing = 10;

        modules-left = [ "cpu" "memory" "temperature" "disk" "battery" "network" ];
        modules-center = [ "custom/active-windows" ];
        modules-right = [ "niri/language" ];

        "cpu" = {
	      interval = 10;
	      format = "  {usage}%";
	      states = {
	        medium = 50;
	        high = 70;
	        critical = 90;
	      };
		};
        # Оперативная память
    	"memory" = {
		  interval = 10;
		  format = "  {percentage}%";
		  format-alt = "  {used}GiB";
		  states = {
	    	medium = 50;
	        high = 70;
	    	critical = 90;
		  };
		  on-click = "";
		  tooltip = true;
    	  tooltip-format = "Total RAM: {total} GiB\nUsed: {used} GiB\n\nTotal SWAP: {swapTotal} GiB\nUsed SWAP: {swapUsed} GiB";
        };
		# Температура
        "temperature" = {
		  interval = 10;
		  thermal-zone = 22;
		  critical-threshold = 70;
		  format-critical = " {temperatureC}°";
		  format = " {temperatureC}°";
		  tooltip = false;
    	};
		# Диск
    	"disk" = {
		  interval = 60;
		  format = "󰋊 {specific_used:.0f}GB";
		  format-alt = "󰋊 {percentage_used}%";
		  unit = "GB";
		  tooltip = true;
		  tooltip-format = "Размер диска:        {specific_total:.1f}GB\nСвободно:       {specific_free:.1f}GB({percentage_free}%)\nИспользовано:      {specific_used:.1f}GB({percentage_used}%)";
    	};
    	# Батарея
    	"battery" = {
		  interval = 60;
		  design-capacity = false;                      # Использовать текущую ёмкость, не проектную
		  format = "{icon} {capacity}%";		   # Отображение: заряд в % и иконка
		  format-alt = "{icon} {power}W";
		  format-charging = "󰂄 {capacity}%";
		  states = {
	    	medium = 50;
	    	critical = 20;
		  };
		  format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];     # Иконки батареи для разных уровней
		  tooltip-format-charging = "До полной зарядки: {time}\nЗдоровье: {health}%\nЦиклов: {cycles}";
		  tooltip-format-discharging = "Потребляет: {power}W\nОсталось работы: {time}\nЗдоровье: {health}%\nЦиклов: {cycles}";
    	};
    	# Интернет
    	"network" = {
		  format = "{icon}";
		  format-alt = "{icon}  {bandwidthDownBytes}  {bandwidthUpBytes}";
		  format-wifi = "{icon} {signalStrength}%";
		  format-ethernet = "󰈀";
		  format-linked = "󰤬";                # Когда нет ip
		  format-disconnected = "󰤮";
		  format-disabled = "󰤫";          # Интерфейс выключен
		  format-icons = [
	        "󰤮"        # отключено
	    	"󰤟"        # 0-25%    (слабый)
	    	"󰤢"        # 25-50%   (средний)
	    	"󰤥"        # 50-75%   (хороший)
	    	"󰤨"        # 75-100%  (отличный)
		  ];
		  interval = 30;
		  tooltip = true;
		  tooltip-format = "WiFi: {essid} ({frequency} GHz)\n\nИмя интерфейса: {ifname}\n󰩟  {ipaddr}\nШлюз: {gwaddr}\nМаска IPv4: {netmask}(/{cidr})\n\n  {bandwidthDownBytes}   {bandwidthUpBytes}";
		  tooltip-format-wifi = "WiFi: {essid} ({frequency} GHz)\n\nИмя интерфейса: {ifname}\n󰩟  {ipaddr}\nШлюз: {gwaddr}\nМаска IPv4: {netmask}(/{cidr})\n\n  {bandwidthDownBytes}   {bandwidthUpBytes}";
		  tooltip-format-disconnected = "WiFi disconnected";
		  tooltip-format-disabled = "WiFi disabled";
    	};
    	# Раскладка клавиатуры
    	"niri/language" = {
		  format-en = "en";
		  format-ru = "ру";
    	};
      };
    };
  };
}
