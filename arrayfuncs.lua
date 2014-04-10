-- removeTableRows
-- Removes a number of elements from an array, starting at pos
-- Returns a table with the list of removed elements
function removeTableRows( values, pos, number )
    -- Remove 1 element by default
    if number == nil then
        number = 1
    end
    
    -- Initialize removed table and the number of values
    local removed = {}
    local numValues = #values
    
    -- Remove and copy values from 1 to pos
    for i = 0, number - 1 do
        table.insert( removed, table.remove( values, pos ) )
    end
    
    -- Return removed elements
    return removed
end
