{
  programs.git.ignores = [
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
}
