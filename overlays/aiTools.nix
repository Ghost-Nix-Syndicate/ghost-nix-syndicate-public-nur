self: super: {

  # Group all hacking/security tools under a single namespace
  aitools = {
    vllm        = super.vllm;
    ollama-cpu   = super.ollama-cpu;
    openclaw     = super.openclaw;
    neo4j     = super.neo4j;
    qdrant     = super.qdrant;
    nvm     = super.nvm;
    pnpm     = super.pnpm;
    nano     = super.nano;
    treesitter     = super.treesitter;
    neovim     = super.neovim;
    pkgs.vimPlugins.nvim-treesitter-parsers.nix = super.pkgs.vimPlugins.nvim-treesitter-parsers.nix;
    code-server     = super.code-server;


  };

  # Bundle list if you want a single install group
  aitoolsBundle = with self.aitools; [
    openclaw ollama-cpu vllm code-server neovim nvm pnpm qdrant neo4j treesitter pkgs.vimPlugins.nvim-treesitter-parsers.nix
  ];
}