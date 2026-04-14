local options = {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, desc = "Next Git hunk" })

    map("n", "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end,

    -- Inline & Overlay Diffs
    map('n', '<leader>hi', gs.preview_hunk_inline, {desc='Preview hunk inline'})
    map('n', '<leader>td', gs.toggle_deleted, {desc='Toggle deleted lines overlay'})
    map('n', '<leader>tw', gs.toggle_word_diff, {desc='Toggle word diff overlay'}) { expr = true, desc = "Previous Git hunk" })

    -- Actions (Normal Mode)
    map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
    map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
    map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage entire buffer" })
    map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset entire buffer" })
    map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })
    map("n", "<leader>hb", function()
      gs.blame_line { full = true }
    end, { desc = "Blame line" })
    map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle inline blame" })
    map("n", "<leader>hd", gs.diffthis, { desc = "Diff against index" })
    map("n", "<leader>hD", function()
      gs.diffthis "~"
    end, { desc = "Diff against last commit" })

    -- Actions (Visual Mode)
    map("v", "<leader>hs", function()
      gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, { desc = "Stage visual hunk" })
    map("v", "<leader>hr", function()
      gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
    end, { desc = "Reset visual hunk" })
  end,
}

return options
