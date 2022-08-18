local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
    vim.notify("Could not find toggleterm");
    return
end

toggleterm.setup {
    size = 15,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    direction = "horizontal",
    terminal_mappings = true,
    start_in_insert = true,
    persist_mode = true,
    persist_size = true,
}
