{ userArgs, ... }:
let
  inherit (userArgs.git) name email;
in
{
  programs.git = {
    userName = name;
    userEmail = email;
    # signing = {
    #   key = "";
    #   signByDefault = false;
    # };
  };
}
