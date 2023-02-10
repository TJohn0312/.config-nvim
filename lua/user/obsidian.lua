local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
  return
end

obsidian.setup({
  dir = "/mnt/c/Users/tylee/Vault/",
  completion = {
    nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
  }
})
-- Obsidian follow link under cursor
vim.keymap.set( "n", "gf",
  function()
    if obsidian.util.cursor_on_markdown_link() then
      return "<cmd>ObsidianFollowLink<CR>"
    else
      return "gf"
    end
  end,
  { noremap = false, expr = true}
)

