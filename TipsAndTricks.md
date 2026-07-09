# Tips and Tricks

To override code snippets:
Go to snippets directory: ~/.local/share/nvim/lazy/friendly-snippets/snippets/{language}
and modify the snippet

To add custom snippet: see https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#vs-code
nvim snippet plugin : nvim-cmp, luasnip, friendly-snippets

Audio

- There's no sound on headset
  If the machine just when to sleep mode and your headset is turned off, try disconnect and reconnect
  it again. Else:
  Run `pactl info` and check Default Sink
  Run `pactl list sinks` to get the headset sink id
  Run `pactl set-default-sink {above sink id}` to set default sink (output device)

Monitors

- Connecting monitor using DisplayLink (docking stations)
  Follow these instructions: https://wiki.archlinux.org/title/DisplayLink
