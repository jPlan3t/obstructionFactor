function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    if numDecimalPlaces ~= nil then
        return math.floor(num * mult + 0.5) / mult
    else
        return math.floor((num * mult + 0.5) / mult)
    end
end

system.print(round(slot1.getObstructionFactor(), 4) * 100)
