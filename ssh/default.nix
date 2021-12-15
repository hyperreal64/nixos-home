{ config, lib, pkg, ... }:

{
    programs.ssh.enable = true;
    programs.ssh.matchBlocks = {
        "envs" = {
            hostname = "envs.net";
            user = "hyperreal";
        };
        "uc" = {
            hostname = "unixcat.coffee";
            user = "uc";
        };
    };
}
