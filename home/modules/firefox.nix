{ config, pkgs, lib, ... }:

{
  programs.firefox = {
    enable = true;
    #########################
    ### Настройки политик ###
    #########################
    policies = {
      AllowFileSelectionDialogs = true;      # Разрешаем диалоги выбора файлов
      AutofillAddressEnabled = false;        # Отключаем автозаполнение адресов
      AutofillCreditCardEnabled = false;     # Отключаем автозаполнение способов оплаты
      BackgroundAppUpdate = false;           # Отключаем автоматическое обновление в фоновом режиме, когда приложение не запущено
      CaptivePortal = false;                 # Отключаем автоматическое определение “каптив-порталов” Wi-Fi 
      Cookies = {                         
        Locked = true;
        Behavior = "reject‑tracker";                                         # Блокируем cookie от известных трекеров
        BehaviorPrivateBrowsing = "reject‑tracker‑and‑partition‑foreign";    # Блокируем cookie от известных трекеров и изолируем куки в разные “корзины”
      };
      DisableDeveloperTools = false;          # Не отключаем инструменты разработчика
      DisableFeedbackCommands = true;         # Отключаем меню для сайтов с жалобами («Отправить отзыв», «Сообщить о мошенническом сайте»)
      DisableFirefoxScreenshots = true;       # Отключаем скриншоты Firefox
      DisableFirefoxStudies = true;           # Отключаем исследования на нас от Firefox
      DisableForgetButton = true;             # Отключаем кноппку forget
      DisableFormHistory = true;              # Отключаем сохранение истории в формах
      DisableMasterPasswordCreation = true;   # Отключаем функциональность мастер пароля
      DisablePasswordReveal = true;           # Отключаем отображение паролей в сохраненных логинах
      DisableProfileImport = true;            # Отключаем опцию «Импортировать данные из другого браузера» в окне закладок
      DisableProfileRefresh = true;           # Отключаем кнопку «Обновить Firefox» в about:support и support.mozilla.org и сообщение обновить Firefox, если долго им им не пользовались
      DisableSetDesktopBackground = true;     # Отключаем пункт меню «Установить как фон рабочего стола» при щелчке правой кнопкой мыши по изображению
      DisableTelemetry = true;                # Отключаем загрузку данных телеметрии
      DisplayMenuBar = "never";               # Отключаем самую верхнюю строку (File, Edit, View, History, Bookmarks, Tools, Help и т.п.)
      DontCheckDefaultBrowser = true;         # Отключаем проверку, является ли Firefox браузером по умолчанию при запуске
      DownloadDirectory = "${config.home.homeDirectory}/Downloads";      # Устанавливаем и блокируем директорию для загрузок
      EnableTrackingProtection = {
        Locked = true;
        Value = true;                         # Включаем защиту от отслеживания
        Category = "strict";                  # Уровень (жёсткая защита)
        Cryptomining = true;                  # Блокировка скриптов, которые пытаются майнить криптовалюту
        Fingerprinting = true;                # Блокировка скриптов, которые собирают “отпечаток” устройства
        EmailTracking = true;                 # Блокировка скрытых пикселей отслеживания, которые вставляются в письма и встраиваются на сайты
        SuspectedFingerprinting = true;       # Блокировка строгая для скриптов, которые собирают “отпечаток” устройства
        BaselineExceptions = true;            # Авто исключения необходимые для предотвращения серьезных поломок веб-сайтов
        ConvenienceExceptions = true;         # Авто исключения необходимые для предотвращения поломок более мелких удобств на сайтах
      };
      ExtensionSettings = {
        "*" = {                                                # Правила для всех расширений
          installation_mode = "blocked";                       # Блокируем установку расширений из магазина       
          blocked_install_message = "Установка декларативно";  # Сообщение при попытке установить из магазина
        };
        "uBlock0@raymondhill.net" = {                          
          installation_mode = "force_installed";               # Устанавливаем автоматически и блокируем удаление
          private_browsing = true;                             # Включаем для приватного браузера
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
      };
      FirefoxHome = {                        # Настройки стартовой страницы
        Locked = true;
        Search = false;                      # Отключаем поисковую панель
        TopSites = false;                    # Отключаем часто посещаемые сайты
        SponsoredTopSites = false;           # Отключаем рекламные сайты
        Highlights = false;                  # Отключаем недавно посещённые страницы
        Pocket = false;                      # Отключаем рекомендованные статьи Pocket
        Stories = false;                     # Отключаем рекомендованные статьи
        SponsoredPocket = false;             # Отключаем спонсируемые статьи от Pocket
        SponsoredStories = false;            # Отключаем спонсируемые истории
        Snippets = false;                    # Отключаем короткие сообщения от Mozilla
      };
      GenerativeAI = {
        Locked = true;
        Enabled = false;                     # Отключаем ИИ
        Chatbot = false;                     # Отключаем ИИ‑чат‑бот в боковой панели
        LinkPreviews = false;                # Отключаем ИИ‑превью ссылок
        TabGroups = false;                   # Отключаем ИИ‑подсказки для групп вкладок
      };
      HardwareAcceleration = true;           # Включаем аппаратное ускорение
      Homepage = {                           # Настройки домашней страницы (TODO: можно установить свой url тут)
        Locked = true;
        StartPage = "previous-session";      # При открытии Firefox восстановить вкладки
      };

    };

    #########################
    ### Настройки профиля ###
    #########################
    profiles.xymod = {
      isDefault = true;
    };
  };
}
