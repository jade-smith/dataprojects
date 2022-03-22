local geo = {}

geo.pos = {["x"] = 0, ["y"] = 0, ["z"] = 0, ["direction"] = 0}

geo.POSITIVE_Y = 0 -- forward
geo.NEGATIVE_X = 1 -- left
geo.NEGATIVE_Y = 2 -- backward
geo.POSITIVE_X = 3 -- right

function geo.face(direction)
    while geo.pos.direction ~= direction do
        local isFourthQuadrant = (direction == geo.POSITIVE_Y and
                                     geo.pos.direction == geo.POSITIVE_X) or
                                     (direction == geo.POSITIVE_X and
                                         geo.pos.direction == geo.POSITIVE_Y)

        if direction > geo.pos.direction and not isFourthQuadrant then
            turtle.turnLeft()
            geo.pos.direction = (geo.pos.direction + 1) % 4
        else
            turtle.turnRight()

            geo.pos.direction = (geo.pos.direction - 1)

            if geo.pos.direction < 0 then
                geo.pos.direction = geo.POSITIVE_X
            end
        end
    end
end

local function move(mv, detect, dig, attack, updater)
    return function(distance)
        for i = 1, distance do
            while not mv() do
                if turtle.getFuelLevel() == 0 then
                    print("Out of fuel...")
                    os.exit(1)
                end
                if detect() then
                    dig()
                else
                    attack()
                end
            end
            updater()
        end
    end
end

local forward = move(turtle.forward, turtle.detect, turtle.dig, turtle.attack,
                     function()
    if (geo.pos.direction == geo.POSITIVE_Y) then geo.pos.y = geo.pos.y + 1 end
    if (geo.pos.direction == geo.NEGATIVE_Y) then geo.pos.y = geo.pos.y - 1 end
    if (geo.pos.direction == geo.POSITIVE_X) then geo.pos.x = geo.pos.x + 1 end
    if (geo.pos.direction == geo.NEGATIVE_X) then geo.pos.x = geo.pos.x - 1 end
end)

local up = move(turtle.up, turtle.detectUp, turtle.digUp, turtle.attackUp,
                function() geo.pos.z = geo.pos.z + 1 end)
local down = move(turtle.down, turtle.detectDown, turtle.digDown,
                  turtle.attackDown, function() geo.pos.z = geo.pos.z - 1 end)

function geo.moveTo(x, y, z, direction)

    if (x ~= geo.pos.x) then
        if (x > geo.pos.x) then geo.face(geo.POSITIVE_X) end
        if (x < geo.pos.x) then geo.face(geo.NEGATIVE_X) end
        forward(math.abs(x - geo.pos.x))
    end
    if (y ~= geo.pos.y) then
        if (y > geo.pos.y) then geo.face(geo.POSITIVE_Y) end
        if (y < geo.pos.y) then geo.face(geo.NEGATIVE_Y) end
        forward(math.abs(y - geo.pos.y))
    end
    if (z ~= geo.pos.z) then
        local _distance = math.abs(z - geo.pos.z)
        if (z > geo.pos.z) then up(_distance) end
        if (z < geo.pos.z) then down(_distance) end
    end

    if direction ~= nil then geo.face(direction) end
end

return geo
