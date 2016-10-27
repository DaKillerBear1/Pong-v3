paddles = {}

Paddle = {
  x = 0, 
  y = 0,
  width = 20,
  height = 100,
  moveSpeed = 1000,
  colour = {255, 255, 255}, -- Red, Green, Blue
  points = 0,

  moveScheme = {
    up = "w",
    down = "s"
  },

  new = function(self)
    t = {}
    for k, v in pairs(self) do
      t[k] = v
    end
    return t
  end,

  moveUp = function(self, dt)
    self.y = self.y - (self.moveSpeed * dt)
  end,

  moveDown = function(self, dt)
    self.y = self.y + (self.moveSpeed * dt)
  end
}

function drawPaddles()
  for k, paddle in pairs(paddles) do
    graphics.setColor(paddle.colour)
    graphics.rectangle("fill", paddle.x, paddle.y, paddle.width, paddle.height)
    graphics.setColor(255, 255, 255)
  end
end

function updtPaddles(dt)
  local screenPadding = 10
  local minimumPaddleY = 0 + screenPadding
  local maximumPaddleY = screenHeight - (Paddle.height + screenPadding)
  
  for _, paddle in pairs(paddles) do
    if isPressed(paddle.moveScheme.up) and paddle.y > minimumPaddleY then
      paddle:moveUp(dt)
    end
    if isPressed(paddle.moveScheme.down) and paddle.y < maximumPaddleY then
      paddle:moveDown(dt)
    end
  end
end

function createPaddle(name, x, y)
  paddles[name] = Paddle:new()
  paddles[name].x = x
  paddles[name].y = y
end