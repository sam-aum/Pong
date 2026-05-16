WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


function love.load()

    -- Set the window mode
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })
end

function love.draw()

    love.graphics.printf("Hello, World!", 0, WINDOW_HEIGHT / 2 - 6, WINDOW_WIDTH, "center")
end