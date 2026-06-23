push = require 'push'
-- Class = require 'class'

require 'Paddle'


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
    player2y = Paddle(VIRTUAL_WIDTH - 10, VIRTUAL_HEIGHT - 30, 5, 20)
    
    
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

    player1:update(dt)
    player2:update(dt)

    if gameState == 'play' then
        ballX = ballX + ballDX * dt
        ballY = ballY + ballDY * dt
    end



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

            ballX = VIRTUAL_WIDTH / 2 - 2
            ballY = VIRTUAL_HEIGHT / 2 - 2

            ballDX = math.random(2) == 1 and 100 or -100
            ballDY = math.random(-50, 50)
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

    -- render ball
    love.graphics.rectangle('fill', ballX, ballY, 4, 4)
    
    push:finish()

end