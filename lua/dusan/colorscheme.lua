-- https://github.com/sainnhe/sonokai/blob/master/doc/sonokai.txt
local colorscheme = "sonokai"

vim.cmd("let g:sonokai_style = 'andromeda'")

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end


