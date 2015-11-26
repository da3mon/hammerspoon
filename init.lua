local trio = 'command-alt-control'

hs.hints.style = 'vimperator'
hs.window.animationDuration = 0
hs.grid.setGrid("7x2")
hs.grid.setMargins({w = 0, h = 0})
hs.hotkey.bind(trio, 'l', hs.caffeinate.startScreensaver)

function highlightFocus()
  local hl = hs.drawing.rectangle(hs.window.focusedWindow():frame())
  hl:setFillColor(hs.drawing.color.hammerspoon.osx_green)
  hl:setAlpha(0.3)
  hl:show()
  hs.timer.doUntil(function()
    if hl:alpha() > 0.01 then
      return false
    end
    hl:hide()
    return true
  end, function()
    hl:setAlpha(0.90 * hl:alpha())
  end, 0.01)
end

alf = hs.hotkey.modal.new(trio, 'space')
broom = hs.hotkey.modal.new()
sizer = hs.hotkey.modal.new()
zoomer = hs.hotkey.modal.new()

function alf:entered() hs.alert 'GO' end
alf:bind('control', 'g', 'DONE', function() alf:exit() end)
alf:bind('shift', '/', '', hs.hints.windowHints)
alf:bind('', 'm', '', function() broom:enter() end)
alf:bind('', 's', '', function() sizer:enter() end)
alf:bind('', 'z', '', function() zoomer:enter() end)
alf:bind('', 'right', 'next', hs.spotify.next)
alf:bind('', 'left', 'previous', hs.spotify.previous)
alf:bind('', 'space', 'pause', hs.spotify.play)
alf:bind('', 'h', '', function()
  hs.window.focusedWindow():focusWindowWest()
  highlightFocus()
end)
alf:bind('', 'j', '', function()
  hs.window.focusedWindow():focusWindowSouth()
  highlightFocus()
end)
alf:bind('', 'k', '', function()
  hs.window.focusedWindow():focusWindowNorth()
  highlightFocus()
end)
alf:bind('', 'l', '', function()
  hs.window.focusedWindow():focusWindowEast()
  highlightFocus()
end)

function broom:entered() hs.alert 'MOVE' end
broom:bind('control', 'g', 'POP', function() broom:exit() end)
broom:bind('', 'w', '', hs.hints.windowHints)

function sizer:entered() hs.alert 'RESIZE' end
sizer:bind('control', 'g', 'POP', function() sizer:exit() end)
sizer:bind('', 'w', '', hs.hints.windowHints)

broom:bind({'shift'}, 'h', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.x = max.x
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

broom:bind({'shift'}, 'l', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.x = max.x + (max.w / 2)
	f.y = max.y
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

broom:bind({'shift'}, 'k', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.x = max.x
	f.y = max.y
	f.w = max.w
	f.h = max.h / 2
	win:setFrame(f)
end)

broom:bind({'shift'}, 'j', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.x = max.x
	f.y = max.y + (max.w / 2)
	f.w = max.w
	f.h = max.h / 2
	win:setFrame(f)
end)

broom:bind({''}, 'l', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.x = max.x + (2 * max.w / 3)
	f.y = max.y
	f.w = max.w / 3
	f.h = max.h
	win:setFrame(f)
end)

broom:bind({''}, 'c', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.x = max.x + (max.w / 3)
	f.y = max.y
	f.w = max.w / 3
	f.h = max.h
	win:setFrame(f)
end)

broom:bind({''}, 'h', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.x = max.x
	f.y = max.y
	f.w = max.w / 3
	f.h = max.h
	win:setFrame(f)
end)

sizer:bind({''}, 'h', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.w = f.x / 2
	win:setFrame(f)
end)

sizer:bind({''}, 'l', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.w = f.x * 2
	win:setFrame(f)
end)

sizer:bind({''}, 'k', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.h = f.h / 2
	win:setFrame(f)
end)

sizer:bind({''}, 'j', function()
	local win = hs.window.focusedWindow()
	local f = win:frame()
	local screen = win:screen()
	local max = screen:frame()
	f.h = max.h * 2
	win:setFrame(f)
end)
