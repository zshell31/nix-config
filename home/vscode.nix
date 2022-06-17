{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      matklad.rust-analyzer
      serayuzgur.crates

    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "theme-dracula";
        publisher = "dracula-theme";
        version = "2.24.2";
        sha256 = "1bsq00h30x60rxhqfdmadps5p1vpbl2kkwgkk6yqs475ic89dnk0";
      }
    ];
  };
}
