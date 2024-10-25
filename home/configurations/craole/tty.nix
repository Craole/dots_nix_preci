{ config, prefs, ... }:
let
  apps = config.programs;
  editor = prefs.editor.primary;
  inherit (apps) fish zsh;
in
{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      historyControl = [
        "erasedups"
        "ignorespace"
      ];
      historyFileSize = 10000;
    };
    git = {
      enable = true;
      userName = "Craole";
      userEmail = "32288735+Craole@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        core = {
          inherit editor;
        };
        credentials.helper = "cache --timeout=3600";
        pull.ff = "only";
        color.ui = "auto";
      };
      ignores = [
        #| Nix
        "*.drv"
        "*.nar"
        "*.narinfo"
        ".direnv"
        ".result"
        "result/"

        #| Rust
        "target/"
        "*.rs.bk"

        #| Python
        "__pycache__/"
        "*.py[cod]"
        ".mypy_cache/"

        #| Node.js
        "node_modules/"
        "npm-debug.log"

        #| IDE
        ".zed/"
        ".vscode/"
        ".idea/"

        #| Logs and temporary files
        "*.log"
        "*.tmp"

        #| Environment variables
        ".env"
        ".env.local"
      ];
      aliases = {
        st = "status"; # Show the working tree status
        sty = "status --porcelain &2>/dev/null"; # Show the working tree status in machine-friendly format
        co = "checkout"; # Checkout a branch or file
        br = "branch"; # List, create, or delete branches
        cm = "commit --message"; # Commit changes
        cam = "commit --amend --message"; # Amend the previous commit
        lg = "log --oneline --graph --decorate"; # Pretty log output
        aa = "add --all"; # Add all changes to the index
        rb = "rebase"; # Start a rebase session
        # pu='''!f() { [ \"$(git status --porcelain)\" ] && git add --all && git status --short && git commit --quiet --message=\"${*:-"Auto Update"}\" && git push; }; f''';

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
        pu = ''
          !f() {
            msg="Auto Update"; [ "$*" ] && msg="$*"; \
            git commit --quiet --message="$msg" && \
            git push
          }; f
        '';
      };
    };
    starship = {
      enable = true;
      enableFishIntegration = fish.enable;
      enableZshIntegration = zsh.enable;
    };
    lsd = {
      enable = true;
      enableAliases = true;
      settings = { };
    };
    eza = {
      enable = true;
      icons = true;
      git = true;
      extraOptions = [
        "--group-directories-first"
      ];
      enableFishIntegration = fish.enable;
      enableZshIntegration = zsh.enable;
    };
    direnv = {
      enable = true;
      silent = true;
    };
    ripgrep = {
      enable = true;
      arguments = [
        "--smart-case"
        "--max-columns-preview"
        "--color=line:style:bold"
      ];
    };
    fd = {
      enable = true;
      extraOptions = [ "--absolute-path" ];
      ignores = [ ];
    };
  };
}
