WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

push = require 'push'

function love.load()

    -- Set the default filter
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('font.ttf', 16)
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

    -- set LÖVE2D's active font to the smallFont obect
    love.graphics.setFont(smallFont)

    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    love.graphics.printf("Hello", 0, 20, VIRTUAL_WIDTH, "center")
    
    
    -- render paddle 1 (left side)
    love.graphics.rectangle('fill', 10, 30, 5, 20)
    
    -- render paddle 2 (right side)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 15, VIRTUAL_HEIGHT - 50, 5, 20)

    -- render ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
    
    push:finish()

end