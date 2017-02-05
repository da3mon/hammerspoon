sizer = hs.hotkey.modal.new()

function sizer:entered() hs.alert 'NUDGE' end
sizer:bind('control', 'g', '🌮', function() sizer:exit() end)
sizer:bind('', 'w', '', hs.hints.windowHints)

sizer:bind({''}, 'h', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = f.x - 10
    win:setFrame(f)
end)

sizer:bind({''}, 'j', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.y = f.y - 10
    win:setFrame(f)
end)

sizer:bind({''}, 'l', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.x = f.x + 10
    win:setFrame(f)
end)

sizer:bind({''}, 'k', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    f.y = f.y + 10
    win:setFrame(f)
end)
