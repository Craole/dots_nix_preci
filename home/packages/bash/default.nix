{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFileSize = 10000;
    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
    shellOptions = [
      "autocd"
      "cdspell"
      "cmdhist"
      "dotglob"
      "histappend"
      "expand_aliases"
    ];
  };
}
