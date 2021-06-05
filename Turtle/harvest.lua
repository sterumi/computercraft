function refuel()
    for i = 1, 16 do
        selected_slot = turtle.select(i)
        if selected_slot then
            local data = turtle.getItemDetail();

            if data then
                if turtle.refuel() then
                    print('Fuel state: ' .. turtle.getFuelLevel() .. " / " .. turtle.getFuelLimit())
                end
            end
        end
    end
end

function harvest(item_name)
    local block, inspect = turtle.inspect()

    if(inspect) then
        if inspect.name == item_name then
            if inspect.state.age == 7 then
                turtle.dig()
                turtle.place()
            end
        end
    end
end

function checkRight(item_name)
    turtle.turnRight()
    harvest(item_name)
    turtle.turnLeft()
end

function checkBlockInfront()
    local block, inspect = turtle.inspect()
    return block
end

function checkWater()
    local block, inspect = turtle.inspectDown()
    if inspect then
        return inspect.name == "minecraft:water"
    end

    return false
end

function checkChest()
    local block, inspect = turtle.inspect()

    if inspect then
        return inspect.name == 'minecraft:chest'
    end

    return false
end

function go(item_name)
    while not checkBlockInfront() do
        checkRight(item_name)
        turtle.forward()
    end

    if checkChest() then
        turtle.drop()
    end


    turtle.turnLeft()
    turtle.turnLeft()
end

while true do
    wait = 10
    minute = 60
    fullTime = wait * minute

    for i = 1, wait, 1 do
        os.sleep(minute)
        print('Noch ' .. fullTime - i * minute .. ' Sekunden')
    end

    print("Do the Ehrenrunde thing: " .. textutils.formatTime(os.time(), true))

    refuel()
    go('minecraft:potatoes')
end

