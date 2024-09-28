{ editor, ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Craole";
      userEmail = "32288735+Craole@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        core = {
          inherit editor;
        };
        credentials.helper = "cache --timeout=3600";
      };
    };
    firefox = {
      enable = true;
      profiles.default = {
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://github.com/Craole/nixos-config";
          "browser.tabs.warnOnCloseOtherTabs" = false;
          "browser.tabs.warnOnOpen" = false;
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.history" = false;
          "browser.urlbar.suggest.openpage" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "dom.battery.enabled" = false;
          "dom.enable_performance" = false;
          "dom.enable_resource_timing" = false;
          "dom.event.clipboardevents.enabled" = false;
          "dom.gamepad.enabled" = false;
          "dom.indexedDB.enabled" = false;
          "dom.min_timeout_value" = 400;
          "dom.push.connection.enabled" = false;
          "dom.push.enabled" = false;
          "dom.serviceWorkers.enabled" = false;
          "dom.serviceWorkers.interception.enabled" = false;
          "dom.storage.enabled" = false;
          "dom.webaudio.enabled" = false;
          "extensions.autoDisableScopes" = 15;
          "extensions.getAddons.cache.enabled" = false;
          "extensions.getAddons.showPane" = false;
          "extensions.pocket.enabled" = false;
          "extensions.screenshots.disabled" = true;
          "extensions.webservice.discoverURL" = false;
          "geo.enabled" = false;
          "geo.wifi.uri" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
          "geo.wifi.logging.enabled" = false;
          "media.autoplay.enabled" = false;
          "media.getusermedia.screensharing.enabled" = false;
          "media.navigator.enabled" = false;
          "media.peerconnection.enabled" = false;
          "media.video_stats.enabled" = false;
          "network.captive-portal-service.enabled" = false;
          "network.cookie.cookieBehavior" = 1;
          "network.cookie.lifetimePolicy" = 2;
          "network.dns.disablePrefetch" = true;
          "network.http.referer.spoofSource" = true;
          "network.http.referer.trimmingPolicy" = 2;
          "network.http.referer.XOriginPolicy" = 2;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "network.predictor.enabled" = false;
          "network.prefetch-next" = false;
          "privacy.donottrackheader.enabled" = true;
          "privacy.donottrackheader.value" = 1;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.pbmode.enabled" = true;
          "privacy.trackingprotection.cryptomining.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.userContext.enabled" = true;
          "security.csp.enable" = false;
          "security.fileuri.strict_origin_policy" = true;
          "security.fileuri.strict_origin_policy_max_connections" = 100;
          "security.insecure_connection_text.enabled" = true;
          "security.mixed_content.block_active_content" = true;
          "security.mixed_content.block_display_content" = true;
          "security.ssl.errorReporting.automatic" = false;
          "services.sync.enabled" = false;
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.unified" = false;
          "webgl.disabled" = true;
          "webgl.enable-debug-renderer-info" = false;
          "webgl.min_capability_mode" = true;
        };
      };
    };
    
    
  };
}
