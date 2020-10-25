# CLI next gen
{ config, lib, pkgs, ... }:
let
  nixGL = import ( pkgs.fetchFromGitHub {
      owner = "guibou";
      repo = "nixGL";
      rev = "fad15ba09de65fc58052df84b9f68fbc088e5e7c";
      sha256 = "1wc5gfj5ymgm4gxx5pz4lkqp5vxqdk2njlbnrc1kmailgzj6f75h";
  }) {};
in
{
  home.packages = with pkgs; [
    nixGL.nixGLDefault
    mlterm # fast term
    rxvt-unicode
    audacious
    firefox
    vlc
    shutter
  ];
  # solve the locale problems
  home.sessionVariables = {
    LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
  };
}
