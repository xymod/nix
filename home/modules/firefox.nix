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
        Default = "DuckDuckGo";              # Поисковик по умолчанию
        PreventInstalls = true;              # Запрещаем установку поисковика с веб-страниц
        Remove = [ "Google" "Bing" "Perplexity" "Wikipedia (en)" ];        # Удаляем встроенные поисковики
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
      Preferences =
      let                                                       # Объявляем переменные
        lock-false = { Value = false; Status = "locked"; };
        lock-true  = { Value = true;  Status = "locked"; };
      in {    
        ##################
        ### MOZILLA UI ###
        ##################
        "browser.discovery.enabled" = lock-false;                                               # Отключаем персональные рекомендации расширений
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = lock-false;        # Не предлагать расширения, основываясь на действиях
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = lock-false;      # Не советовать функции браузера
        "browser.aboutConfig.showWarning" = lock-false;                                         # Не показывать предупреждение в about:config
        "toolkit.legacyUserProfileCustomizations.stylesheets" = lock-true;                      # Для применения кастомного CSS
        "layout.css.prefers-color-scheme.content-override" = { Value = 0; Status = "locked"; }; # Применяем темную тему
        ##################
        ###     AI     ###
        ##################
        "browser.ml.enable" = lock-false;                            # Глобально отключаем ИИ
        "browser.ml.chat.menu" = lock-false;                         # Отключаем ИИ в меню ПКМ
        "browser.tabs.groups.smart.enabled" = lock-false;            # Отключаем ИИ‑подсказки для групп вкладок
        "browser.ml.linkPreview.enabled" = lock-false;               # Отключаем ИИ-превью ссылок
        ####################################
        ###          Переводчик          ###
        ####################################
        "browser.translations.enable" = lock-true;                   # Включаем встроенный переводчик
        "browser.translations.automaticallyPopup" = lock-false;      # Отключаем всплывающее окно о переводе
        ####################################
        ### Подсказки в поисковой строке ###
        ####################################
        "browser.urlbar.suggest.history" = lock-false;               # Отключает предложения из истории
        "browser.urlbar.suggest.bookmark" = lock-false;              # Отключаем показ закладок
        "browser.urlbar.suggest.clipboard" = lock-false;             # Отключаем предложения из буфера обмена
        "browser.urlbar.suggest.openpage" = lock-false;              # Отключаем подсказки из открытых вкладок
        "browser.urlbar.suggest.engines" = lock-false;               # Отключаем “Search with <движок>”
        "browser.urlbar.suggest.weather" = lock-false;               # Отключаем прогноз погоды
        "browser.urlbar.suggest.calculator" = lock-false;            # Отключаем калькулятор 
        "browser.urlbar.unitConversion.enabled" = lock-false;        # Отключаем конвертацию единиц
        "browser.urlbar.suggest.topsites" = lock-false;              # Отключаем предложения самых посещаемых сайтов
        "browser.urlbar.trending.featureGate" = lock-false;          # Отключаем трендовые поисковые подсказки
        "browser.urlbar.suggest.trending" = lock-false;              # Отключаем сам механизм подсказок трендовых запросов
        "browser.urlbar.recentsearches.featureGate" = lock-false;    # Отключаем отображение недавних запросов
        "browser.urlbar.autoFill" = lock-false;                      # Отключаем автоматическое дописывание URL
        "browser.urlbar.autoFill.adaptiveHistory.enabled" = lock-false;    # Отключаем интеллектуальное автозаполнение на основе адаптивной истории
        ####################################
        ###        Быстродействие        ###
        ####################################
        "layout.frame_rate" = { Value = 120; Status = "locked"; };                      # Частота обновления
        "gfx.content.skia-font-cache-size" = { Value = 32; Status = "locked"; };        # Размер кеша шрифтов
        "gfx.canvas.accelerated.cache-items" = { Value = 32768; Status = "locked"; };   # Сколько объектов canvas хранить в кэше GPU
        "gfx.canvas.accelerated.cache-size" = { Value = 4096; Status = "locked"; };     # Объём памяти для кэша ускорённого canvas
        "browser.cache.disk.enable" = lock-false;                                       # Отключаем дисковый кэш браузера
        "browser.cache.memory.capacity" = { Value = 4096; Status = "locked"; };         # Максимальный объём оперативной памяти для кэширования данных
        "browser.cache.memory.max_entry_size" = { Value = 4096; Status = "locked"; };   # Максимальный размер одной записи в кэше
        ####################################
        ###           Скроллинг          ###
        ####################################
        "general.smoothScroll" = lock-true;                                                                  # Включаем плавную прокрутку
        "general.smoothScroll.msdPhysics.enabled" = lock-true;                                               # Включаем физическую модель прокрутки
        "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = { Value = 12; Status = "locked"; };   # Частота обновления, меньше = более гладкие расчёты
        "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = { Value = 600; Status = "locked"; };   # Влияет на быстроту старта прокрутки
        "general.smoothScroll.msdPhysics.regularSpringConstant" = { Value = 650; Status = "locked"; };       # Жёсткость пружины 
        "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = { Value = 25; Status = "locked"; };           # Минимальный дельта-время при замедлении
        "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = { Value = 2; Status = "locked"; };         # Когда прокрутка начнёт замедление, больше = мягче тормоз
        "general.smoothScroll.msdPhysics.slowdownSpringConstant" = { Value = 250; Status = "locked"; };      # Как быстро прокрутка замедляется
        "general.smoothScroll.currentVelocityWeighting" = { Value = 1; Status = "locked"; };                 # Влияние инерции
        "general.smoothScroll.stopDecelerationWeighting" = { Value = 1; Status = "locked"; };                # Больше = медленнее и плавнее останавливается
      };

    };

    #########################
    ### Настройки профиля ###
    #########################
    profiles.xymod = {
      isDefault = true;
      settings = {                              # Настройки pref (без блокировки)
        ##############################
        ### Боковая панель вкладок ###
        ##############################
        "sidebar.verticalTabs" = true;                               # Включаем вертикальные вкладки
        "sidebar.position_start" = true;                             # Расположение панели вертикальных вкладок слева
        "sidebar.visibility" = "expand-on-hover";                    # Панель вертикальных вкладок скрыта, разворачивается при наведении
        "sidebar.main.tools" = " ";                                  # Отключаем все значки с панели вертикальных вкладок
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;      # Отключаем подсказку при первом открытии
        "sidebar.animation.expand-on-hover.delay-duration-ms" = 0;   # Задержка для раскрытия при наведении
        "sidebar.animation.expand-on-hover.duration-ms" = 180;       # Скорость раскрытия/скрытия
        ##############################
        ###       Скроллинг        ###
        ##############################
        "apz.overscroll.enabled" = false;                            # Отключаем эффект "overscroll"
        "mousewheel.default.delta_multiplier_y" = "300";             # Yасколько “большие шаги” прокрутки скролла
      };
    };
  };
}
