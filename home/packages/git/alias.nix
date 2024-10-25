{
  programs.git.aliases = {
    # | Basic
    a = "add";
    aa = "add --all";
    d = "diff";
    dc = "diff --cached";
    pl = "pull";
    pu = "push";
    puf = "push --force";
    s = "status";
    ss = "status --short";
    spy = "status --porcelain &2>/dev/null";

    # | Checkout
    co = "checkout";
    cob = "checkout -b";
    com = "checkout master";

    # | Commit
    amend = "commit --amend --no-edit";
    c = "commit";
    ca = "commit -a";
    cam = "commit -a -m";
    cm = "commit -m";

    # | Rebase
    rb = "rebase";
    rba = "rebase --abort";
    rbc = "rebase --continue";
    rbi = "rebase --interactive";
    rbs = "rebase --skip";

    # | Reset
    r = "reset HEAD";
    r1 = "reset HEAD^";
    r2 = "reset HEAD^^";
    rhard = "reset --hard";
    rhard1 = "reset HEAD^ --hard";
    rhard2 = "reset HEAD^^ --hard";

    # | Stash
    sd = "stash drop";
    spo = "stash pop";
    spu = "stash push";
    spua = "stash push --all";

    # | Other
    lg = "log --graph --abbrev-commit --decorate --format=format:'%C(blue)%h%C(reset) - %C(green)(%ar)%C(reset) %s %C(italic)- %an%C(reset)%C(magenta bold)%d%C(reset)' --all";
    br = "branch";
    rs = "restore --staged";
    root = "rev-parse --show-toplevel";
    pus = ''
      !f() {
        msg="Auto Update"; [ "$*" ] && msg="$*"; \
        git commit --quiet --message="$msg" && \
        git push
      }; f
    '';
    up = ''
      !f() {
        [ "$(git status --porcelain)" ] && \
        git add --all && \
        git status --short && \
        if [ -z "$1" ]; then \
          git commit --quiet --message="Auto Update" && \
          git push; \
        else \
          git commit --quiet --message="$1" && \
          git push; \
        fi
      }; f
    '';
  };

  home.shellAliases = {
    cd-groot = ''cd "$(git root)"'';
  };
}
