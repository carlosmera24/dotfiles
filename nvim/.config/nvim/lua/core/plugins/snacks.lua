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
            sections = {
                { section = "header" },
                {
                    icon = "", title = "Keymaps", section = "keys", indent = 2, padding = 1,
                    { icon = "󰣇", desc = "Mason", action = ":Mason", key = "m" },
                    { icon = "󰉓", desc = "Files with Yazi", action = ":Yazi", key = "y" },
                },
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
