require('modules/broom')
require('modules/sizer')
require('modules/alf')

local trio = 'command-alt-control'

hs.hints.style = 'vimperator'
hs.window.animationDuration = 0
hs.grid.setGrid("7x2")
hs.grid.setMargins({w = 0, h = 0})
hs.hotkey.bind(trio, 'l', hs.caffeinate.startScreensaver)

zoomer = hs.hotkey.modal.new()
