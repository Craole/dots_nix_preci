let
  importAll =
    path:
    let
      toImport = name: type: type == "directory" && name != "default.nix";
      filterImport = name: type: !(toImport name type);
      imports = builtins.attrNames (builtins.readDir path);
    in
    map (name: simpleImport "${toString path}/${name}") (filter filterImport imports);

  simpleImport =
    path:
    let
      relativePath = removePrefix (toString ./.) path;
      toImport = name: type: type == "regular" && hasSuffix ".nix" name;
      modules = builtins.attrNames (builtins.readDir path);
    in
    map (name: import "${relativePath}/${name}") (filter filterImport modules);
in
{
  imports = importAll ./.;
}
