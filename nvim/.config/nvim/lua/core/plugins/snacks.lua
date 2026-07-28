return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- Config for yazi
        image = {
            formats = {
                "png",
                "jpg",
                "jpeg",
                "gif",
                "bmp",
                "webp",
                "tiff",
                "heic",
                "avif",
                "mp4",
                "mov",
                "avi",
                "mkv",
                "webm",
                "pdf",
            },
            force = true,
        },
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                -- Sobrescribir los keymaps por defecto del dashboard
                keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":Telescope fd" },
                { icon = "󰉓", key = "y", desc = "Files with Yazi", action = ":Yazi" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
                { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
                { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                { icon = "󰣇", key = "m", desc = "Mason", action = ":Mason" },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", indent = 2, padding = 1 },
                { section = "startup" },
            }
        },
        indent = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
    },
}
