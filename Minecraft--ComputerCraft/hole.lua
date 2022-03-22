local geo = require "geo"

io.write('Enter width: ')
local width = tonumber(io.read()) - 1 -- X, Y

io.write('Enter depth: ')
local depth = tonumber(io.read()) -- Z
local remainingDepth = depth

local function getZFromRemainingDepth() return (depth - remainingDepth) * -1 end

while geo.pos.z > (depth * -1) do

    for y = 0, width do

        for x = 0, width do
            geo.moveTo(x, y, getZFromRemainingDepth())
            turtle.digDown()
        end

    end

    remainingDepth = remainingDepth - 1
end

geo.moveTo(0, 0, 0)
