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
        perl534Packages.Appcpanminus
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
		python3Full
        rakudo
		rustup
        vscode
		yarn
        zef
    ];

    fontPkgs = with pkgs; [
        google-fonts
        ibm-plex
        nerdfonts
    ];

    netPkgs = with pkgs; [
        amfora
		discord
		electron-mail
		element-desktop
        httpie
		lagrange
        nmap-graphical
        prettyping
		protonmail-bridge
        w3m
    ];

    utilPkgs = with pkgs; [
        bottom
        bpytop
        coreutils
        du-dust
        duf
        fd
		gnome.gnome-tweaks
        hyperfine
        killall
        libnotify
        lsof
        neofetch
        nushell
        offlineimap
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
		syncthing-tray
        tealdeer
        tmux
		trash-cli
        unzip
		vivid
        xclip
        zip
    ];

in

    {
        programs.home-manager.enable = true;

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
            documents = "\$HOME/documents";
            download = "\$HOME/downloads";
            pictures = "\$HOME/pictures";
            publicShare = "\$HOME/misc";
            music = "\$HOME/misc/music";
            templates = "\$HOME/templates";
            videos = "\$HOME/misc/videos";
        };

		programs.git = {
			enable = true;
			userEmail = "hyperreal@unixcat.coffee";
			userName = "Jeffrey Serio";
			extraConfig = {
				core = {
					editor = "nvim";
					pager = "diff-so-fancy | less --tabs=4 -RFX";
				};
				init.defaultBranch = "main";
				pull.rebase = true;
			};
		};

		programs.gpg = {
			enable = true;
			settings = {
				default-key = "0x9129BD07C3509CED";
				no-emit-version = true;
				no-comments = true;
				display-charset = "utf-8";
				keyid-format = "0xlong";
				with-fingerprint = true;
				use-agent = true;
			};
		};

		programs.htop.enable = true;

		programs.jq.enable = true;

		programs.direnv = {
			enable = true;
			nix-direnv.enable = true;
		};
		
		programs.fzf = {
			enable = true;
			defaultCommand = "fd --type f";
		};
		
		programs.bat = {
			enable = true;
			config = {
				pager = "less -FR";
				theme = "Dracula";
			};
		};
		
		programs.exa.enable = true;
		
		programs.ssh.enable = true;
		programs.ssh.matchBlocks = {
			"envs" = {
				hostname = "envs.net";
				user = "hyperreal";
			};
			"uc" = {
				hostname = "unixcat.coffee";
				user = "core";
			};
			"az" = {
				hostname = "azura.local";
				user = "uc";
			};
		};

		services.syncthing.enable = true;
    }
