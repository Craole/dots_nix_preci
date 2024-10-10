{ editor, ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "Craole";
      userEmail = "32288735+Craole@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = editor;
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
        co = "checkout"; # Checkout a branch or file
        br = "branch"; # List, create, or delete branches
        cm = "commit -m"; # Commit with a message
        lg = "log --oneline --graph --decorate"; # Pretty log output
        ap = "add -p"; # Add changes interactively
        rb = "rebase"; # Start a rebase session
      };
    };
    firefox = {
      enable = true;
    };
    mpv = {
      enable = true;
    };
  };
}
