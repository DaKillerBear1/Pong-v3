 function loadVar() -- Loads the required global variables
    graphics = love.graphics
    screenWidth, screenHeight = graphics.getDimensions()
  end

function calcReturnAngle(val, minAngle, maxAngle, paddleLength)
  -- Calculates and returns the return angle for the ball depending on
  -- where it strikes on the paddle

  local angleRange = maxAngle - minAngle
  local step = angleRange / paddleLength 
  local deltaAngle = step * val

  return deltaAngle + minAngle
end

function clampReturnVal(val, min, max) -- Clamps a value between a maximum and a minimum value
  return math.max(min, math.min(max, val))
end

function getDeltaY(obj1, obj2) -- Returns the y difference between two objects
  return obj1.y - obj2.y
end

function getSideOfScreen(obj) -- Checks which side of the screen an object is on.
  if obj.x > (screenWidth / 2) then
    return "right"
  else
    return "left"
  end
end

 function isColliding(obj1, obj2) -- Checks and returns wether two objects are intersecting or not
   x1, y1 = obj1.x, obj1.y
   x2, y2 = obj2.x, obj2.y
   w1, h1 = obj1.width, obj1.height
   w2, h2 = obj2.width, obj2.height
   
   return x1 < x2+w2 and x2 < x1+w1 and y1 < y2+h2 and y2 < y1+h1
end

function isPressed(key) -- Returns if a speciffic key is pressed or not
  return love.keyboard.isDown(key)
end

function trueDegrees(val) 
-- Rotates a given angle counter-clockwise so that
-- the correct result is achieved when passing an angle
-- to either the cos() os sin() function.
  
  local newVal = val
  
  for i = 1, 90 do
    if newVal == 0 then
      newVal = 360
    end
    newVal = newVal - 1
  end
  return newVal
end

function LMBIsDown()
  return love.mouse.isDown(1)
end

function debugLoad() -- For debugging/testing purposes only
  createPaddle("p1", 10, (screenHeight / 2) - 50)
  
  createPaddle("p2", screenWidth - 30, (screenHeight / 2) - 50)
  paddles.p2.moveScheme = {up = "up", down = "down"}
  
  
  createBall("b1", (screenWidth / 2) - 10, (screenHeight / 2) - 10)
  balls.b1.dx = math.cos(math.rad(trueDegrees(270))) * Ball.moveSpeed
  balls.b1.dy =  math.sin(math.rad(trueDegrees(270))) * Ball.moveSpeed
  
  createButton("testbutton" ,50, 50, 100, 50, "Test", function() print("Test") end)
end