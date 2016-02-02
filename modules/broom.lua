broom = hs.hotkey.modal.new()

function broom:entered() hs.alert 'MOVE' end
broom:bind('control', 'g', '🍶', function() broom:exit() end)
broom:bind('', 'w', '', hs.hints.windowHints)

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
  f.y = max.y / 2
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
