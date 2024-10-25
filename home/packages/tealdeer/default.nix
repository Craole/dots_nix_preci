{
  programs.tealdeer = {
    enable = true;
    settings = {
      display = {
        compact = true;
        use_pager = true;
      };
      updates = {
        auto_update = true;
        auto_update_interval_hours = 720;
      };
    };
  };
}
