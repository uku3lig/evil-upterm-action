{
  pkgs ? import <nixpkgs> { },
  terminfos,
}:
let
  names = pkgs.lib.splitString "," terminfos;
  terminfoDerivs = map (x: pkgs.pkgsBuildBuild.${x}.terminfo) names;
in
pkgs.symlinkJoin {
  name = "all-terminfo";
  paths = terminfoDerivs ++ [ pkgs.ncurses ];
}
