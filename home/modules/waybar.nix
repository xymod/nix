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
      };
    };
  };
}
