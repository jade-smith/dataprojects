local geo = require "geo"

local function readNumber() return tonumber(io.read()) end

io.write('Enter width: ')
local width = readNumber() - 1 -- X, Z

io.write('Enter depth: ')
local depth = readNumber() -- Y
local remainingDepth = depth

local function getYFromRemainingDepth() return depth - remainingDepth end

while geo.pos.y < depth do
    for z = 0, width do

        for x = 0, width do geo.moveTo(x, getYFromRemainingDepth(), z) end

    end
    remainingDepth = remainingDepth - 1
end

geo.moveTo(0, 0, 0, geo.POSITIVE_Y)
