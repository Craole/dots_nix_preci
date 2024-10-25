{
  lib,
  userArgs,
  coreArgs,
  ...
}:
let
  app = "wezterm";
  inherit (coreArgs) dots;
  inherit (userArgs.theme) colors;
  inherit (colors) mode;
  inherit (colors.${mode}) scheme;
  color_scheme = scheme.${app};
in
{
  programs.wezterm.extraConfig =
    let
      luaFormat = lib.generators.toLua { };
      lua = luaFormat {
        inherit color_scheme;

        # | BEHAVIOR
        check_for_updates = false;
        enable_wayland = true;
        window_close_confirmation = "NeverPrompt";
        prefer_to_spawn_tabs = true;
        # hide_mouse_cursor_when_typing = false;

        # | WINDOW
        window_decorations = "NONE";
        # window_background_opacity = 0.90;
        default_cursor_style = "BlinkingBlock";
        initial_cols = 140;
        initial_rows = 72;
        font_size = 18.0;
        default_cwd = dots.default;

        # | TAB BAR
        # enable_tab_bar = false;
        hide_tab_bar_if_only_one_tab = true;
        # show_new_tab_button_in_tab_bar = false;
        show_tab_index_in_tab_bar = false;
        # show_tabs_in_tab_bar = false;
        # switch_to_last_active_tab_when_closing_tab = true;
        # tab_and_split_indices_are_zero_based = true;
        # tab_bar_at_bottom = true;
        # tab_bar_style = {}; # This can be interesting to play with
        # tab_max_width = 12;
        # use_fancy_tab_bar = false;

        # window_frame = {
        #   inactive_titlebar_bg = base00;
        #   active_titlebar_bg = base00; #> Tab bar background
        #   inactive_titlebar_fg = base00;
        #   active_titlebar_fg = base05;
        #   inactive_titlebar_border_bottom = base00;
        #   active_titlebar_border_bottom = base00;
        #   button_fg = base00;
        #   button_bg = base00;
        #   button_hover_fg = base05;
        #   button_hover_bg = base00;

        #   # border_left_width = "0.3cell";
        #   # border_right_width = "0.3cell";
        #   # border_bottom_height = "0.15cell";
        #   # border_top_height = "0.15cell";
        #   # border_left_color = colors.accent;
        #   # border_right_color = colors.accent;
        #   # border_bottom_color = colors.accent;
        #   # border_top_color = colors.accent;
        # };
      };
    in
    "return ${lua}";
}
