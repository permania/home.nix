{...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "permania";
      user.email = "0onesixed@gmail.com";
    };
  };

  programs.vim = {
    enable = true;
    settings = {
      number = true;
      relativenumber = true;
    };
  };
}
