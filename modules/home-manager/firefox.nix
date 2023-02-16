# User configuration for firefox
{ pkgs, ...}:

{
  # Set firefox as the default browser
  home.sessionVariables = { BROWSER = "firefox"; };

  programs.firefox = {
    # Install firefox
    enable = true;

    # Setup firefox (settings are from the about:config page in firefox)
    profiles.default.settings = {
      # Do not show the warning when opening the `about:config` page
      "browser.aboutConfig.showWarning" = false;
      # Set the default download directory
      "browser.download.dir" = "/home/bondzula/downloads";
      # Remember and suggest the location of the most recent download before downloading a file
      "browser.download.folderList" = 2;
      # Do not automatically fill in forms
      "browser.formfill.enable" = false;
      # Disable suggestions in the search bar
      "browser.search.suggest.enabled" = false;
      # Do not check if Firefox is the default browser
      "browser.shell.checkDefaultBrowser" = false;
      # Start Firefox with an empty page
      "browser.startup.homepage" = "about:blank";
      # Disable the Firefox View feature
      "browser.tabs.firefox-view" = false;
      # Merge tabs and titlebar
      "browser.tabs.inTitlebar" = 1;
      # Set the default text in the address bar to "Search with DuckDuckGo or enter address"
      "browser.urlbar.placeholderName" = "DuckDuckGo";
      # Same as the line above, but for private tabs
      "browser.urlbar.placeholderName.private" = "DuckDuckGo";
      # Do not suggest previously visited pages in the URL bar
      "browser.urlbar.suggest.history" = false;
      # Do not suggest opened tabs in the URL bar
      "browser.urlbar.suggest.openpage" = false;
      # Disable the Pocket feature
      "extensions.pocket.enabled" = false;
      # Do not autoplay audio and video content on websites
      "media.autoplay.default" = 5;
      # Prevent websites from requesting permission to send desktop notifications
      "permissions.default.desktop-notification" = 2;
    };

    profiles.default.extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      keepassxc-browser
    ];
  };
}
