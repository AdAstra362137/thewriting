{ inputs, config, pkgs, lib, ... }:
let
  repoRoot = "${config.home.homeDirectory}/NixOS";
  storeSelf = toString ./.;
  storeRoot = toString inputs.self;
  subpath = lib.removePrefix "${storeRoot}/" storeSelf;
  realPath = "${repoRoot}/${subpath}";
  name = builtins.baseNameOf realPath;
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  xdg.configFile.${name} = {
    source = create_symlink realPath;
    recursive = true;
  }; 
  home.packages = with pkgs; [
    fzf
    ripgrep
    lua-language-server
    nixpkgs-fmt
    nodejs
  ];

  programs.neovim = {
    enable = true;
    sideloadInitLua = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      nvim-treesitter
      nvim-lspconfig
      base16-nvim
      lualine-nvim
    ];
    extraConfig = ''
    set clipboard=unnamedplus
    '';
  };
}
