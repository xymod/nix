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
      HttpsOnlyMode = "force_enabled";       # Включаем только HTTPS, и блокируем отключение
      NetworkPrediction = false;             # Отключаем DNS запросы по неоткрытым ссылкам
      NewTabPage = false;                    # Отключаем стандартную страницу “Новая вкладка”, будет пустая страница
      NoDefaultBookmarks = true;             # Отключаем автоматическое создание стандартных закладок
      OfferToSaveLogins = false;             # Отключаем предложения сохранить пароли
      OverrideFirstRunPage = "";             # Страница, которая будет показана при первом открытии Firefox (пусто = пропустить welcome page)
      PasswordManagerEnabled = false;        # Отключаем менеджер паролей
      Permissions = {                        # Устанавливаем разрешения
        Camera = {
          Locked = true;
          BlockNewRequests = true;           # Блокируем запросы камеры 
        };
        Microphone = {
          Locked = true;
          BlockNewRequests = true;           # Блокируем запросы микрофона
        };
        Location = {
          Locked = true;
          BlockNewRequests = true;           # Блокируем запросы местоположения
        };
        Notifications = {
          Locked = true;
          BlockNewRequests = true;           # Блокируем запросы уведомлений
        };
        Autoplay = {
          Locked = true;
          Default = "block-audio-video";     # Блокируем автовоспроизведение аудио и видео
        };
        VirtualReality = {
          Locked = true;
          BlockNewRequests = true;           # Блокируем запросы VR
        };
        ScreenShare = {
          Locked = true;
          BlockNewRequests = true;           # Блокируем запросы поделиться экраном
        };
      };
      PictureInPicture = true;               # Включаем функцию картинка в картинке
      PopupBlocking = {
        Locked = true;
        Default = true;                      # Блокируем всплывающие окна
      };
      PrintingEnabled = true;                # Включаем печать
      PromptForDownloadLocation = false;     # Отключаем вопросы куда скачать файл
      SearchBar = "unified";                 # Едины URL бар
      SearchEngines = {
        Default = "ddg";                     # Поисковик по умолчанию Duck Duck GO
        PreventInstalls = true;              # Запрещаем установку поисковика с веб-страниц
        Remove = [ "Google" ];               # Удаляем встроенные поисковики
      };
      SearchSuggestEnabled = false;          # Отключаем подсказки поиска
      SkipTermsOfUse = true;                 # Отключаем отображение Условий использования и Уведомлений о конфиденциальности при запуске
      UserMessaging = {                      # Какие сообщения отправлять
        Locked = true;
        ExtensionRecommendations = false;    # Не показывать рекомендации расширений
        FeatureRecommendations = false;      # Не рекомендовать функции браузера
        UrlbarInterventions = false;         # Не показывать советы в адресной строке
        SkipOnboarding = true;               # Пропустить приветственные подсказки при первом запуске
        MoreFromMozilla = false;             # Не показывать раздел “Больше от Mozilla” в настройках
        FirefoxLabs = false;                 # Отключить раздел Firefox Labs (эксперименты) в настройках
      };
      VisualSearchEnabled = false;           # Отключаем поиск через изображения
      
      ####################################################
      ### Настройки pref через политики (с блокировкой)###
      ####################################################
      Preferences = {                        
      };

    };

    #########################
    ### Настройки профиля ###
    #########################
    profiles.xymod = {
      isDefault = true;
      settings = {
        "sidebar.verticalTabs" = true;
      };
    };
  };
}
