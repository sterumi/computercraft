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
    local inspect = turtle.inspect()

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

function checkWater()
    return turtle.inspectDown().name == "minecraft:water"
end

function go(item_name)
    while checkWater() do
        checkRight(item_name)
    end

    turtle.back()
    turtle.turnLeft()
    turtle.turnLeft()
end


refuel()
go()

