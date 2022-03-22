print('Enter diameter: ')
local diameter = tonumber(io.read())
print('Enter depth: ')
local depth = tonumber(io.read())

while depth > 0 do
    for y = 1, diameter do
        for x = 1, diameter do
            turtle.digDown()
            if x < diameter then turtle.forward() end
        end

        if y % 2 == 0 then
            turtle.turnLeft()
            if y < diameter then turtle.forward() end
            turtle.turnLeft()
        else
            turtle.turnRight()
            if y < diameter then turtle.forward() end
            turtle.turnRight()
        end
    end
    if not turtle.down() then print("failed to go down") end
    depth = depth - 1
end
