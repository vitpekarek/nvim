vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {'  Find File          '}, command = 'Telescope find_files'},
    b = {description = {'  Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {'  Projects           '}, command = 'Telescope projects'},
    d = {description = {'  Files              '}, command = 'Telescope projects'},
    -- c = {description = {'  Load Last Session  '}, command = 'SessionLoad'},
    e = {description = {'  Find Word          '}, command = 'Telescope live_grep'},
    f = {description = {'  Settings           '}, command = ':e ~/AppData/Local/nvim/lua/settings.lua'},
    -- f = {description = {'  Marks              '}, command = 'Telescope marks'}
}

