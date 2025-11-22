{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
	style = ''
	  * { all: unset; }
      /* Общее для всех */
      window#waybar {
        font-family: "Iosevka NF Light";
        font-size: 30px;
        color: #E9E9E9;
      }
	  /* Верхний бар */
	  window#waybar.top {
    	background: rgba(32, 32, 32, 0.99);
    	border: 2px solid #575757;
    	border-top: none;
    	border-radius: 0 0 35px 35px;  /* верх-лево | верх-право | низ-право | низ-лево */
	  }
	  /* Модули верхнего бара */
	  window#waybar.top .modules-left {
        padding-left: 20px;
	  }
	  window#waybar.top .modules-right {
        padding-right: 20px;
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
        height = 50;

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
	    	medium": 50;
	        high": 70;
	    	critical": 90;
		  };
		  on-click = "";
		  tooltip = true;
    	  tooltip-format = "Total RAM: {total} GiB\nUsed: {used} GiB\n\nTotal SWAP: {swapTotal} GiB\nUsed SWAP: {swapUsed} GiB";
    	};
      };
    };
  };
}
