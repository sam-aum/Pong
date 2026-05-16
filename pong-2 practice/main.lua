WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

push = require 'push'

function love.load()

    -- Set the default filter
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- Set the window mode
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = 'normal' })
end


function love.keypressed(key)

    if key == "escape" then
        love.event.quit()
    end
end


function love.draw()

    push:start()
    love.graphics.printf("Hello, World!", 0, (VIRTUAL_HEIGHT / 2) - 6, VIRTUAL_WIDTH, "center")
    push:finish()

end