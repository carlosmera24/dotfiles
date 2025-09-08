return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
        {'nvim-tree/nvim-web-devicons'}
    },
    opts = {
        theme = "hyper",
        config = {
            header = {
                ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
                ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
                ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
                ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
                ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
                ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
                'Krlos'
            },
            week_header = {
                enable = true,
                append = {
                    "Neovim: " .. vim.version().major .. "." .. vim.version().minor
                }
            },
            shortcut = {
                {
                    desc = ' Lazy',
                    group = 'DiagnosticHint',
                    action = 'Lazy',
                    key = 'l'
                },
                {
                    desc = ' Mason Update',
                    group = 'DiagnosticHint',
                    action = 'Mason',
                    key = 'm'
                },
                {
                    desc = " Files",
                    group = "file",
                    action = "Number",
                    key = "f",
                },
                {
                    desc = ' Search Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 's',
                },
            },
            project = {
                enable = false,
            },
            mru = {
                enable = false,
            },
            footer = {
                'Krlos'
            }
        }
    }
}
