balls = {}

Ball = {
  x = 0, 
  y = 0,
  dx = 0,
  dy = 0,
  width = 20,
  height = 20,
  moveSpeed = 1000,
  colour = {255, 255, 255},
  
  new = function(self)
    t = {}
    for k, v in pairs(self) do
      t[k] = v
    end
    return t
  end
}

function drawBalls()
  for _, ball in pairs(balls) do
    graphics.setColor(ball.colour)
    graphics.rectangle("fill", ball.x, ball.y, ball.width, ball.height)
    graphics.setColor(255, 255, 255)
  end
end

function updtBalls(dt)
  for k1, paddle in pairs(paddles) do
    for k2, ball in pairs(balls) do
      if isColliding(paddle, ball) then
        local deltaY = clampReturnVal(getDeltaY(ball, paddle) + (ball.width/2), 0, paddle.height)
        local returnAngle = calcReturnAngle(deltaY, 45, 135, paddle.height)
        
        if getSideOfScreen(paddle) == "right" then
          returnAngle = 360 - returnAngle
        end
        
        returnAngle = trueDegrees(returnAngle)
        
        local newDx = math.cos(math.rad(returnAngle)) * ball.moveSpeed
        local newDy = math.sin(math.rad(returnAngle)) * ball.moveSpeed
        
        ball.dx = newDx
        ball.dy = newDy
      end
    end
  end
  
  for _, ball in pairs(balls) do
    ball.x = ball.x + (ball.dx * dt)
    ball.y = ball.y + (ball.dy * dt)
  end
  
  for _, ball in pairs(balls) do
    if ball.y <= 0 or ball.y + ball.width >= screenHeight then
      ball.dy = -ball.dy
    end
    if ball.x <= 0 or ball.x + ball.width >= screenWidth then
      love.event.quit()
      ball.dx = -ball.dx
    end
  end
end

function createBall(name, x, y)
  balls[name] = Ball:new()
  balls[name].x = x
  balls[name].y = y
end