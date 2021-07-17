{ config, lib, pkgs, stdenv, ... }:

let
    batPkgs = with pkgs; [
        bat
        bat-extras.batdiff
        bat-extras.batgrep
        bat-extras.batman
        bat-extras.batwatch
        bat-extras.prettybat
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

    netPkgs = with pkgs; [
        amfora
        castor
        httpie
        nmap
        nmap-graphical
        prettyping
        restic
        urlscan
        w3m
    ];

    utilPkgs = with pkgs; [
        bottom
        bpytop
        duf
        du-dust
        fd
        fzf
        hyperfine
        jq
        killall
        libnotify
        lsof
        neofetch
        nix-direnv
        nushell
        onedrive
        pass
        powershell
        ripgrep
        rpi-imager
        shellcheck
        shfmt
        s-tui
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
        ./kitty/default.nix
        ./shell/default.nix
        ./ssh/default.nix
    ];

    nixpkgs.config.allowUnfree = true;

    home = {
        username = "jas";
        homeDirectory = "/home/jas";
        stateVersion = "21.05";

        packages = batPkgs ++ develPkgs ++ fontPkgs ++ netPkgs ++ utilPkgs;
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
