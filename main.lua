function love.load()
  require("gameFunctions")
  require("button")
  require("paddle")
  require("ball")
  
  loadVar()
  debugLoad() -- Only for testing and debugging, remove in final release.
end

function love.update(dt)
  updtPaddles(dt)
  updtBalls(dt)
  updtButton()
end

function love.draw()
  drawPaddles()
  drawBalls()
  drawButtons()
end