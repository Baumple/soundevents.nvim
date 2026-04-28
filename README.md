# Soundevents
A simple plugin that allows you to configure sounds that play whenever a
certain event occurs via autocommands.

## Example config
```lua
-- lazy
return {
  "Baumple/soundevents.nvim",
  opts = {
    { event = "BufWritePost", file = "~/path/to/sound/file" }
    { event = "InsertLeaver", file = "~/path/to/sound/file" }
    { event = "InsertEnter", file = "~/path/to/sound/file" }
    { event = "BufReadPost", file = "~/path/to/sound/file" }
  },
}
```

## User commands
- `SEStart`: Start soundevent.nvim i.e. create autocommands
- `SEStop`: Stop soundevent.nvim i.e. clear autocommands

## Requirements
Requires `ffmpeg` or more specifially `ffplay` in order to work.

## Disclaimer
I don't know who or why anyone would use this.
