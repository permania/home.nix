{...}: {
  programs.qutebrowser = {
    enable = true;
    searchEngines = {
      DEFAULT = "https://www.google.com/search?hl=en&q={}";
      w = "https://en.wikipedia.org/wiki/Special:Search?search={}&go=Go&ns0=1";
      aw = "https://wiki.archlinux.org/?search={}";
      np = "https://search.nixos.org/packages?channel=25.11&query={}";
      no = "https://search.nixos.org/options?channel=25.11&query={}";
      hm = "https://home-manager-options.extranix.com/?query={}&release=release-25.11";
    };
    settings = {
      url.start_pages = "https://www.google.com";
      colors.webpage.darkmode.enabled = true;
    };
  };
}
