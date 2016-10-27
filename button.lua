buttons = {}

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

function drawButton()
  for _, button in pairs(buttons) do
    local textX = button.x + (button.width - string.len(button.text / 2))
    local textY = button.y + (button.height / 2)
    
    graphics.setColor(button.colour)
    graphics.rectangle("Fill",, button.y, button.width, button.height)
    graphics.setColor(0, 0, 0)
    graphics.print(button.text, textX, textY, button.colour)
    graphics.setColor(255, 255, 255)
  end
end

function updtButton()
end