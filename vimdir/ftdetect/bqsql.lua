vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.bqsql",
  callback = function()
    vim.bo.filetype = "sql"
    vim.bo.commentstring = "-- %s"

    -- BigQuery固有のキーワードハイライト（オプション）
    vim.cmd([[
      syntax keyword sqlKeyword STRUCT ARRAY UNNEST SAFE_CAST
      syntax keyword sqlFunction CURRENT_DATETIME PARSE_DATETIME
    ]])
  end,
})
