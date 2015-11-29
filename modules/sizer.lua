sizer = hs.hotkey.modal.new()

function sizer:entered() hs.alert 'RESIZE' end
sizer:bind('control', 'g', 'POP', function() sizer:exit() end)
sizer:bind('', 'w', '', hs.hints.windowHints)

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
