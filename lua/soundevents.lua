---A mapping from autocommand to the file to play
---@class soundevents.EventConfig
---@field event string autocommand name such as 'BufWritePost'
---@field file string file to play

---@class soundevents.Config
---@field opts { events: soundevents.EventConfig[] }
---@field enabled boolean Whether plugin is running

local M = {
    enabled = false,
}

---Setup function
---@param opts table
M.setup = function(opts)
    opts = opts or {}
    for _, opt in ipairs(opts) do
        opt.file = vim.fn.expand(opt.file)
    end
    M.opts = opts
end

local group = vim.api.nvim_create_augroup("soundevents.nvim", { clear = true })
---Create autocommand that plays the given file
---@param aucmd string the event to listen attach to
---@param file string the path to the audio file to play
local function attach_sound(aucmd, file)
    vim.api.nvim_create_autocmd(aucmd, {
        group = group,
        callback = function()
            vim.system(
                { "ffplay", "-v", "0", "-nodisp", "-autoexit", file },
                { detach = true, }, function(obj)
                    if obj.code ~= 0 then vim.print(obj) end
                end
            )
        end,
    })
end

---Attach autocommands
function M.start()
    if M.enabled then
        print("soundevents.nvim is already running")
        return
    end

    M.enabled = true
    for _, event_config in ipairs(M.opts) do
        attach_sound(event_config.event, event_config.file)
    end
end

---Clear all autocommands
function M.stop()
    if not M.enabled then
        print("soundevents.nvim is already stopped")
        return
    end

    M.enabled = false
    vim.api.nvim_clear_autocmds({ group = group })
end

return M
