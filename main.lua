  function loadMenu()
    Menu = {
      x = 0,
      y = 0,
      width = 0,
      height = 0,
      colour = {255, 255, 255},
      
      new = function(self)
        t = {}
        for k, v in pairs(self) do
          t[k] = v
        end
        return t
      end,
      
      buttons = {},
      title = "Unnamed",
    }
  end
  
  function loadButton()
    Button = {
      x = 0,
      y = 0,
      width = 0,
      height = 0,
      colour = {255, 255, 255},
      
      new = function(self)
        t = {}
        for k, v in pairs(self) do
          t[k] = v
        end
        return t
      end,
      
      text = "Unnamed",
      func = function() print("Hello World!") end,
    }
  end
  
  function loadVar() -- Loads the required global variables
    graphics = love.graphics
    screenWidth, screenHeight = graphics.getDimensions()
  end
  
function love.load()
  require("gameFunctions")
  require("paddle")
  require("ball")
  
  loadVar()
  debugLoad() -- Only for testing and debugging, remove in final release.
end

function love.update(dt)
  updtPaddles(dt)
  updtBalls(dt)
end

function love.draw()
  drawPaddles()
  drawBalls()
end