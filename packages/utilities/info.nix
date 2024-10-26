{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # | System/Process
    btop
    procs
    hyperfine
    macchina
    neofetch
    cpufetch
    # strace
    # ltrace
    # kmon

    # | Files
    lsd

    # | Network
    bandwhich
    speedtest-go

    # | Notification
    dunst
    tiramisu
    libnotify
    mako

    # | Help
    tealdeer
    # cod

    # | Code
    tokei
    kondo

    # | Regex
    grex

    # | Password
    # bitwarden
  ];
}
