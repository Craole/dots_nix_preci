{
  programs.git.extraConfig = {
    init = {
      defaultBranch = "main";
    };
    core = {
      editor = "$EDITOR";
      whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
    };
    credentials.helper = "cache --timeout=3600";
    branch.autosetupmerge = "true";
    merge.stat = "true";
    repack.usedeltabaseoffset = "true";
    pull.ff = "only";
    push.default = "current";
    rebase = {
      autoSquash = true;
      autoStash = true;
    };
    rerere = {
      autoupdate = true;
      enabled = true;
    };
  };
}
