{ config, lib, pkgs, stdenv, ... }:

let
    batPkgs = with pkgs.bat-extras; [
        batdiff
        batgrep
        batman
        batwatch
        prettybat
    ];

    develPkgs = with pkgs; [
        cachix
        dconf2nix
        diff-so-fancy
        exercism
        gcc
        gnumake
        nix-direnv
        vscode
    ];

    fontPkgs = with pkgs; [
        ibm-plex
        nerdfonts
    ];

    goPkgs = with pkgs; [
        go
        gosec
        go-tools
        gops
    ];

    netPkgs = with pkgs; [
        amfora
        castor
        httpie
        hugo
        nmap-graphical
        prettyping
        restic
        urlscan
        w3m
    ];

    utilPkgs = with pkgs; [
        antibody
        bottom
        bpytop
        coreutils
        duf
        du-dust
        fd
        hyperfine
        killall
        libnotify
        lsof
        neofetch
        nushell
        onedrive
        pass
        pinentry
        powershell
        ranger
        ripgrep
        rpi-imager
        shellcheck
        shfmt
        s-tui
        tdrop
        tealdeer
        tmux
        urlscan
        xclip
        unzip
        zip
    ];

in

{
    programs.home-manager.enable = true;

    imports = [
        ./dconf/default.nix
        ./git/default.nix
        ./gnome/default.nix
	./gpg/default.nix
        ./kitty/default.nix
        ./shell/default.nix
        ./ssh/default.nix
    ];

    nixpkgs.config.allowUnfree = true;

    home = {
        username = "jas";
        homeDirectory = "/home/jas";
        stateVersion = "21.05";

        packages = batPkgs ++ develPkgs ++ fontPkgs ++ goPkgs ++ netPkgs ++ utilPkgs;
    };

    programs = {
        neomutt.enable = true;
    };

    xdg.userDirs = {
        enable = true;
        createDirectories = true;
        desktop = "\$HOME/desktop";
        documents = "\$HOME/documents";
        download = "\$HOME/downloads";
        pictures = "\$HOME/onedrive/Pictures";
        publicShare = "\$HOME/misc";
        music = "\$HOME/misc/music";
        templates = "\$HOME/misc/templates";
        videos = "\$HOME/misc/videos";
    };
}
