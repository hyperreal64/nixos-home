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
        go
        go-tools
        gops
        gosec
        nix-direnv
        perl
        rakudo
        vscode
        zef
    ];

    fontPkgs = with pkgs; [
        google-fonts
        ibm-plex
        nerdfonts
    ];

    netPkgs = with pkgs; [
        amfora
        castor
        httpie
        lagrange
        nmap-graphical
        prettyping
        restic
        urlscan
        w3m
    ];

    utilPkgs = with pkgs; [
        bottom
        bpytop
        coreutils
        dropbox
        du-dust
        duf
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
        s-tui
        shellcheck
        shfmt
        starship
        tealdeer
        tmux
        unzip
        xclip
        zip
    ];

in

    {
        programs.home-manager.enable = true;

        imports = [
            ./git/default.nix
            ./gpg/default.nix
            ./shell/default.nix
            ./ssh/default.nix
        ];

        nixpkgs.config.allowUnfree = true;

        home = {
            username = "jas";
            homeDirectory = "/home/jas";
            stateVersion = "21.11";

            packages = batPkgs ++ develPkgs ++ fontPkgs ++ netPkgs ++ utilPkgs;
        };

        xdg.userDirs = {
            enable = true;
            createDirectories = true;
            desktop = "\$HOME/desktop";
            documents = "\$HOME/documents";
            download = "\$HOME/downloads";
            pictures = "\$HOME/pictures";
            publicShare = "\$HOME/misc";
            music = "\$HOME/misc/music";
            templates = "\$HOME/templates";
            videos = "\$HOME/misc/videos";
        };
    }
