hs.hints.style = 'vimperator'
hs.window.animationDuration = 0
alf = hs.hotkey.modal.new('command-alt-control', 'space')
broom = hs.hotkey.modal.new()
sizer = hs.hotkey.modal.new()

function alf:entered() hs.alert 'GO' end
alf:bind('control', 'g', 'DONE', function() alf:exit() end)
alf:bind('', 'w', '', hs.hints.windowHints)
alf:bind('', 'm', '', function() broom:enter() end)
alf:bind('', 's', '', function() sizer:enter() end)

function broom:entered() hs.alert 'MOVE' end
broom:bind('control', 'g', '', function() broom:exit() end)
broom:bind('', 'w', '', hs.hints.windowHints)

function sizer:entered() hs.alert 'RESIZE' end
sizer:bind('control', 'g', '', function() sizer:exit() end)
sizer:bind('', 'w', '', hs.hints.windowHints)

alf:bind('', 'right', 'next', hs.spotify.next)
alf:bind('', 'left', 'previous', hs.spotify.previous)
alf:bind('', 'space', 'pause', hs.spotify.play)

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

alf:bind('command', 'r', hs.reload)
