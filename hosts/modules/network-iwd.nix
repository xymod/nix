{ config, pkgs, ... }:

{
  networking = {
    dhcpcd.enable = false;                        # Отключаем чтобы не было конфликта, так как iwd выполнит роль dhcp-клиента
    wireless.iwd = {
      enable = true;                              # Включаем iwd
      settings = {
        General = {
          EnableNetworkConfiguration = true;      # Настройка сети переходит к iwd (dhcp, routes)
          AddressRandomization = "network";       # Рандомизация MAC для каждой сети
        };
        Network = {
          EnableIPv6 = false;                     # Отключение IPv6
          NameResolvingService = "resolvconf";    # Что используем в качестве DNS-сервиса
        };
        Rank = {
          BandModifier6GHz = 3.0;                 # Чем выше значение, там больше приоритет для подключения
          BandModifier5GHz = 2.0;
          BandModifier2_4GHz = 1.0;
        };
        Scan = {
          DisablePeriodicScan = true;          # Отключаем периодическое сканирование (делаем скан вручную, когда надо)
          DisableRoamingScan = true;           # Не будет пытаться переключиться на другую сеть у которой сигнал лучше
        };
        Settings = {
          AutoConnect = true;                  # Авто-подключение к известным сетям
          Hidden = true;                       # Подключение к скрытым сетям
        };
      };
    };
  };
}
