{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        position = "top";
        height = 50;

      "modules-left": ["cpu", "memory", "temperature", "disk", "battery", "network"];
      "modules-center": ["custom/active-windows"];
      "modules-right": ["niri/language";

      "cpu": {
	      interval: 10;
	      format: "  {usage}%";
	      states: {
	        medium: 50;
	        high: 70;
	        critical: 90
	      };
      };
    };
  };
}
