{ ... }:
{
  programs.beets = {
    enable = true;
    settings = {
      import = {
        copy = true;
        write = true;
        move = true;
        autotag = true;
        quiet_fallback = "skip";

        plugins = [
          "fetchart"
          "embedart"
          "chroma"
        ];

        fetchart.auto = true;
      };
    };
  };
}
