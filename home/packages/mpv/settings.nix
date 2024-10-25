{
  programs.mpv.config = {
    # Configuration file settings and the command line options use the same
    # underlying mechanisms. Most options can be put into the configuration file
    # by dropping the preceding '--'. See the man page for a complete list of
    # options.
    #
    # Profiles should be placed at the bottom of the configuration file to ensure
    # that settings wanted as defaults are not restricted to specific profiles.

    ##################
    # Windows Settings #
    ##################

    # | Toggle the window border and title bar.
    border = "no";

    # | Toggle position above/below other windows.
    ontop = "no";

    # | Toggle fullscreen on start.
    fs = "no";

    # | Force the starting position of the window
    geometry = "100%:100%";

    # | Limit the window size relative to the screen size
    autofit-larger = "50%x50%";

    # | Toggle window on exit.
    keep-open = "yes";

    # | Always show a window, even with audio.
    # force-window = "immediate";

    ##################
    # Video settings #
    ##################

    # | Toggle the On Screen Controller (OSC).
    osc = "no";
    osd-bar = "no";
    osd-on-seek = false;

    # Force video to lock on the display's refresh rate, and change video and audio
    # speed to some degree to ensure synchronous playback - can cause problems
    # with some drivers and desktop environments.
    video-sync = "display-resample";

    # Enable hardware decoding if available. Often, this does not work with all
    # video outputs, but should work well with default settings on most systems.
    # If performance or energy usage is an issue, forcing the vdpau or vaapi VOs
    # may or may not help.
    hwdec = "auto";

    ##################
    # audio settings #
    ##################

    # Specify default audio device. You can list devices with: --audio-device=help
    audio-device = "pipewire/default";

    # Do not filter audio to keep pitch when changing playback speed.
    #audio-pitch-correction=no

    # Output 5.1 audio natively, and upmix/downmix audio with a different format.
    #audio-channels=5.1
    # Disable any automatic remix, _if_ the audio output accepts the audio format.
    # of the currently played file. See caveats mentioned in the manpage.
    # (The default is "auto-safe", see manpage.)
    #audio-channels=auto

    ##################
    # other settings #
    ##################

    # Pretend to be a web browser. Might fix playback with some streaming sites,
    # but also will break with shoutcast streams.
    #user-agent="Mozilla/5.0"

    # cache settings
    #
    # Use a large seekable RAM cache even for local input.
    cache = "yes";
    #
    # Use extra large RAM cache (needs cache=yes to make it useful).
    #demuxer-max-bytes=500M
    #demuxer-max-back-bytes=100M
    #
    # Disable the behavior that the player will pause if the cache goes below a
    # certain fill size.
    cache-pause = "no";
    #
    # Store cache payload on the hard disk instead of in RAM. (This may negatively
    # impact performance unless used for slow input such as network.)
    #cache-dir=~/.cache/
    #cache-on-disk=yes

    # Display English subtitles if available.
    slang = "en";

    # Play Finnish audio if available, fall back to English otherwise.
    # alang = "fi,en";

    # Change subtitle encoding. For Arabic subtitles use 'cp1256'.
    # If the file seems to be valid UTF-8, prefer UTF-8.
    # (You can add '+' in front of the codepage to force it.)
    # sub-codepage = "cp1256";

    ############
    # Profiles #
    ############
    # The options declared as part of profiles override global default settings,
    # but only take effect when the profile is active.

    # Specify video rendering quality preset (for --vo=<gpu|gpu-next> only)
    # profile = "fast"; # > Recommended for mobile or slow devices
    profile = "gpu-hq";
    ytdl-format = "bestvideo+bestaudio";
  };
}
