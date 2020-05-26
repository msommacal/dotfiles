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
