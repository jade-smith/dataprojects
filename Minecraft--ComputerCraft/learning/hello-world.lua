print("Hello World")

local name = "value"
local num = 5

if num > 10 then
    print('it\'s greater than 10')
elseif num == 5 then
    print('it\'s 5')
else
    print("whatever")
end

for i = 1, 10 do print("for " .. i) end

local j = 0

while j < 10 do
    print("while " .. j)
    j = j + 1
end

local function nameOfFunc(arg) print(arg) end

nameOfFunc("called this function")

local t = {1, 2, 3, ["key"] = "value"}

print(t['key'])
