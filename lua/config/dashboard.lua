vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Projects           '}, command = 'Telescope projects'},
    d = {description = {'  File Browser       '}, command = 'Telescope file_browser'},
    e = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    f = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    g = {description = {'  Settings           '}, command = ':e ~/AppData/Local/nvim/lua/settings.lua'},
    -- f = {description = {'  Marks              '}, command = 'Telescope marks'}
}

