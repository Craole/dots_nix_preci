# let
#   theme = "light"; # TODO: get the system theme
# in
{
  programs.git = {
    difftastic = {
      enable = true;
      # background = theme;
      color = "always";
      # display = "inline";
    };

    diff-so-fancy = {
      enable = false;
    };

    delta = {
      enable = false;
    };
  };
}
