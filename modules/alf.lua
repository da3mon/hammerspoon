local trio = 'command-alt-control'

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
zoomer = hs.hotkey.modal.new()

alf:bind(trio, 'l', function()
                 hs.caffeinate.startScreensaver()
                 alf:exit()
end)

function alf:entered() hs.alert 'GO' end
alf:bind('control', 'g', 'DONE', function() alf:exit() end)
alf:bind('', 'w', '', hs.hints.windowHints)
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
