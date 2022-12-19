// Required to use userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// Show punycode (for safety reason)
user_pref("network.IDN_show_punycode", true);

// Enable auto-export of bookmarks.html
user_pref("browser.bookmarks.autoExportHTML", true);

// Enable spell checking for both input and textarea fields
user_pref("layout.spellcheckDefault", 2);

// Let the http:// in the URL
user_pref("browser.urlbar.trimURLs", false);

// Ignore links when tab key is pressed to change focus
user_pref("accessibility.tabfocus", 3);

// Disable Pocket
user_pref("extensions.pocket.enabled", false);

// Set the interval between two session backup
user_pref("browser.sessionstore.interval", 120000);

// Enable the encrypted SNI
user_pref("network.security.esni.enabled", true);

// Always show the bookmarks bar
user_pref("browser.toolbars.bookmarks.visibility", "always");

// Hide other bookmarks in the bookmarks bar
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", false);

// Prevent cryptomining
user_pref("privacy.trackingprotection.cryptomining.enabled", true);

// Delete all the cookies at the end of the session
user_pref("network.cookie.lifetimePolicy", 2);
