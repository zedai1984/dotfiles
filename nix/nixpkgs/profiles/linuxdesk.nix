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
    # unrar duf
    ntfs3g
    python3
    nodejs # neovim coc depends
    yarn
    jdk8 # old apps, thinkorswim
    xsel # copy paste in urxvt, perl is also dependended
    nixGL.nixGLDefault
    libGLU
    alacritty
    rxvt-unicode
    autokey
    wmctrl
    xorg.xwininfo
    redshift
    google-chrome
    youtube-dl
    audacious
    vlc
    ffmpeg
    shutter
    gimp
    imagemagick
    virtualbox
    wine
    winetricks
    gtk3
    appimage-run
    tdesktop
    # ibus
    # ibus-engines.libpinyin
    # ibus-engines.table-chinese
  ];
  # solve the locale problems
  home.sessionVariables = {
    LOCALE_ARCHIVE = "${pkgs.glibcLocales}/lib/locale/locale-archive";
  };
  systemd.user.systemctlPath = "systemctl";

  # home manager control xsession
  # temporary using .profile
  # xsession.enable = true;
  # xsession.windowManager.command = "";

  # redshift
  services.redshift = {
    latitude = "37.4";
    longitude = "-122.0";
    enable = true;
    tray = true;
  };

  # firefox
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    profiles =
    let defaultSettings = {
          "app.update.auto" = false;
          "javascript.options.wasm" = true;
          "ui.key.menuAccessKeyFocuses" = false;
          # "browser.startup.homepage" = "https://lobste.rs";
          # # ✂️- no need to splurge all my settings, you get the idea...
          # "identity.fxaccounts.account.device.name" = config.networking.hostName;
          # "signon.rememberSignons" = false;
        };
    in {
      home = {
        id = 0;
        settings = defaultSettings // {
        };
      };

      work = {
        id = 1;
        settings = defaultSettings // {
        };
      };
    };
  };

  # Don't install nix FUSE, just use system one. permission issues!
  systemd.user = {
    services.dropbox_rclone = let
        mountdir="${config.home.homeDirectory}/cloud/dropbox";
      in
      {
      Unit = {
        Description = "dropbox rclone mount";
      };
      Install.WantedBy = [ "multi-user.target" ];
      Service = {
          ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${mountdir}";
          ExecStart = ''
              ${pkgs.rclone}/bin/rclone mount dropbox: ${mountdir}
          '';
          ExecStop = "${pkgs.fuse}/bin/fusermount -uz ${mountdir}";
          Type = "notify";
          Restart = "on-failure";
          RestartSec = "10s";
      };
    };
    services.google_rclone = let
        mountdir="${config.home.homeDirectory}/cloud/google";
      in
      {
      Unit = {
        Description = "google drive rclone mount";
      };
      Install.WantedBy = [ "multi-user.target" ];
      Service = {
          ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${mountdir}";
          ExecStart = ''
              ${pkgs.rclone}/bin/rclone mount google: ${mountdir}
          '';
          ExecStop = "${pkgs.fuse}/bin/fusermount -uz ${mountdir}";
          Type = "notify";
          Restart = "on-failure";
          RestartSec = "3s";
      };
    };
    services.autokey = {
      Unit = {
        After="graphical-session-pre.target";
        PartOf="graphical-session.target";
        Description = "Autokey";
      };
      Install.WantedBy = [ "graphical-session.target" ];
      Service = {
          ExecStart = ''
              ${pkgs.autokey}/bin/autokey-gtk
          '';
          ExecStop = "";
          Restart = "on-failure";
          RestartSec = "3s";
      };
    };
  };
  targets.genericLinux.enable = true;
}
