return {
    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            -- Neovim を開いたときは Copilot を OFF にする
            vim.g.copilot_enabled = false

            -- Copilot の提案を <C-Y> で受け入れる
            vim.api.nvim_set_keymap("i", "<C-Y>", 'copilot#Accept("<CR>")', { expr = true, silent = true, script = true })
            -- Copilot のデフォルトの <Tab> キーマッピングを無効化
            vim.g.copilot_no_tab_map = true

            -- Tab を CoC の補完に使う（CoC が表示されている場合は補完、そうでなければ通常の Tab）
            vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() == 1 ? coc#pum#next(1) : "\<Tab>"]], { expr = true, silent = true })
            -- Shift + Tab で補完選択肢を戻る
            vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() == 1 ? coc#pum#prev(1) : "\<S-Tab>"]], { expr = true, silent = true })

            -- Copilot の提案を <C-J> で次の提案に、<C-K> で前の提案に移動
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Next()', { expr = true, silent = true })
            vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Previous()', { expr = true, silent = true })

            -- Copilot の提案を <C-Space> でトグル
            vim.api.nvim_set_keymap("n", "<C-P>", ":Copilot panel<CR>", { noremap = true, silent = true })
        end
    },
}
