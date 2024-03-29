require("mason").setup()
require("mason-lspconfig").setup({
})

-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- require("lspconfig").bashls.setup { capabilities = capabilities }
-- require("lspconfig").clangd.setup { capabilities = capabilities }
-- require("lspconfig").cmake.setup { capabilities = capabilities }
-- require("lspconfig").cssls.setup { capabilities = capabilities }
-- require("lspconfig").dockerls.setup { capabilities = capabilities }
-- require("lspconfig").jsonls.setup { capabilities = capabilities }
-- require("lspconfig").lua_ls.setup { capabilities = capabilities }
-- require("lspconfig").marksman.setup { capabilities = capabilities }
-- require("lspconfig").pyright.setup { capabilities = capabilities }
-- require("lspconfig").yamlls.setup { capabilities = capabilities }
-- require("lspconfig").vimls.setup { capabilities = capabilities }

local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python
lspconfig.pyright.setup {
 capabilities = capabilities,
}

-- Vim
lspconfig.vimls.setup {
 capabilities = capabilities,
}

-- Bash
lspconfig.bashls.setup {
 capabilities = capabilities,
}

-- Lua (updated to use lua_ls)
lspconfig.lua_ls.setup {
 capabilities = capabilities,
}

-- C/C++
lspconfig.ccls.setup {
 capabilities = capabilities,
}

-- JavaScript/TypeScript
lspconfig.tsserver.setup {
 capabilities = capabilities,
}

-- Java
lspconfig.jdtls.setup {
 capabilities = capabilities,
}

-- Rust
lspconfig.rust_analyzer.setup {
 capabilities = capabilities,
}

-- HTML/CSS
lspconfig.html.setup {
 capabilities = capabilities,
}
lspconfig.cssls.setup {
 capabilities = capabilities,
}

