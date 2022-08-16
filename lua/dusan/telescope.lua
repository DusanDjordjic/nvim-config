local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    vim.notify("Could not find telescope")
end

telescope.setup {
    defaults = {
        mappings  = {
            i = {},
        },
        pickers = {},
        extensions = {},
    },
}
