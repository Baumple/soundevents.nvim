vim.api.nvim_create_user_command(
    "SEStart",
    function()
        require("soundevents").start()
    end,
    {
        desc = "Start soundevents.nvim and create autocommands",
        force = false,
    }
)

vim.api.nvim_create_user_command(
    "SEStop",
    function()
        require("soundevents").stop()
    end,
    {
        desc = "Stop soundevents.nvim and clear autocommands",
        force = false,
    }
)
