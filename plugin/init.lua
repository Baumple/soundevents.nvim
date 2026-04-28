vim.api.nvim_create_user_command(
    "SEStart",
    function()
        require("soundevents").start()
    end,
    {
        desc = "Prints hello",
        force = false,
    }
)

vim.api.nvim_create_user_command(
    "SEStop",
    function()
        require("soundevents").stop()
    end,
    {
        desc = "Prints hello",
        force = false,
    }
)
