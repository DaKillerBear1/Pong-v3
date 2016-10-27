buttons = {}

Button = {
  x = 0,
  y = 0,
  width = 0,
  height = 0,
  colour = {255, 140, 0, 255},
  
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

function createButton(name, x, y, width, height, text, func)
  buttons[name] = Button:new()
  buttons[name].x = x
  buttons[name].y = y
  buttons[name].text = text
  buttons[name].func = func
  buttons[name].width = width
  buttons[name].height = height
end

function drawButtons()
  for _, button in pairs(buttons) do
    local font = graphics.getFont()
    local textX = button.x + ((button.width / 2) - (font:getWidth(button.text)/2))
    local textY = button.y + ((button.height / 2) - (font:getHeight(button.text)/2))
    
    graphics.setColor(button.colour)
    graphics.rectangle("fill", button.x, button.y, button.width, button.height)
    graphics.setColor(0, 0, 0)
    graphics.print(button.text, textX, textY)
    graphics.setColor(255, 255, 255)
  end
end

function updtButton()
  local mouseX, mouseY = love.mouse.getPosition()
  local mouse = {x = mouseX, y = mouseY, width = 1, height = 1}
  
  for _, button in pairs(buttons) do
    if isColliding(mouse, button) then
      button.colour[4] = 128
    else
      button.colour[4] = 255 
    end
  end
end