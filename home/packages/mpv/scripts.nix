{ pkgs, ... }:
{
  programs.mpv.scripts = with pkgs.mpvScripts; [
    # autocrop # ? Automatically crop videos
    autodeint # ? Automatically deinterlace videos
    autoload # ? Automatically load playlist entries
    blacklistExtensions # ? Automatically remove entries based on extension
    chapterskip # ? Automatically skips chapters based on title
    # convert # ? Convert parts of a video while you are watching it
    # cutter # ? Cut videos and concat them automatically
    quack # ? Reduce audio volume after seeking
    quality-menu # ? Change YouTube video quality (ytdl-format)
    # mpvacious # ? Create Anki cards from movies and TV shows
    mpv-playlistmanager
    mpv-cheatsheet # ? keyboard shortcuts
    mpris # ? MPRIS plugin
    inhibit-gnome # ? Prevents screen blanking in GNOME
    reload # Manual & automatic reloading of videos
    sponsorblock-minimal # YouTube sponsored segments skipper
    simple-mpv-webui # Web-based UI
    seekTo # Move to specific position
    # thumbnail # OSC seekbar thumbnails
    thumbfast # High-performance thumbnailer
    uosc # Minimalist proximity-based UI
    visualizer # Visualization for audio only files
    webtorrent-mpv-hook # Torrent streamer
  ];
}
