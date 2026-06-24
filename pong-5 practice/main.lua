push = require 'push'
Class = require 'class'

require 'Paddle'
require 'Ball'


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


PADDLE_SPEED = 200

function love.load()

    -- Set the default filter
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    smallFont = love.graphics.newFont('font.ttf', 8)

    -- set LÖVE2D's active font to the smallFont obect
    love.graphics.setFont(smallFont)

    
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        resizable = true,
        fullscreen = false,
        vsync = true
    })

    -- initialize window with virtual resolution
    push.setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, { upscale = 'normal' })

    
    
    player1 = Paddle(10, 30, 5, 20)
    player2 = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 50, 5, 20)
    
    -- place a ball in the middle of the screen
    ball = Ball(VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 4, 4)
    
    gameState = 'start'


end







function love.update(dt)
    -- player 1 movement
    if love.keyboard.isDown('w') then
        player1.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('s') then
        player1.dy = PADDLE_SPEED
    else
        player1.dy = 0
    end

    -- player 2 movement
    if love.keyboard.isDown('up') then
        player2.dy = -PADDLE_SPEED
    elseif love.keyboard.isDown('down') then
        player2.dy = PADDLE_SPEED
    else
        player2.dy = 0
    end


    if gameState == 'play' then
        ball:update(dt)
    end


    player1:update(dt)
    player2:update(dt)





end



function love.keypressed(key)

    if key == "escape" then
        love.event.quit()
    end

    if key == 'return' or key == 'enter' then
        if gameState == 'start' then
            gameState = 'play'
        else 
            gameState = 'start'

            -- ball's new reset method
            ball:reset()
        end
    end
end



function love.draw()

    push:start()



    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    if gameState == 'start' then
        love.graphics.printf("Hello, Game State", 0, 20, VIRTUAL_WIDTH, "center")
    else
        love.graphics.printf('Hello, Play State', 0, 20, VIRTUAL_WIDTH, 'center')
    end
    
    player1:render()
    player2:render()


    -- render ball using its class's render method
    ball:render()

    push:finish()

end