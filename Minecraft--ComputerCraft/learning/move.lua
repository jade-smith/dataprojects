print('Enter direction (left, right, or back): ')
local direction = io.read()

if direction == 'left' then
    turtle.turnLeft()
elseif direction == 'right' then
    turtle.turnRight()
elseif direction == 'back' then
    turtle.turnLeft()
    turtle.turnLeft()
else
    print("invalid direction")
    return
end

io.write('Enter distance: ')
local distance = io.read()
for block = 1, distance do turtle.forward() end
