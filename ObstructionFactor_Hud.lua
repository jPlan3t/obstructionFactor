function map(func, array)
    local new_array = {}
    for i, v in ipairs(array) do new_array[i] = func(v) end
    return new_array
end

function ternary(cond, T, F)
    if cond then
        return T
    else
        return F
    end
end
--

function getObstructionFactor(slot) return slot.getObstructionFactor() * 100 end

local slots = {
    slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10
}

local obstructions = map(getObstructionFactor, slots)

local slotHTML = ""

for i, obstruction in ipairs(obstructions) do
    slotHTML = slotHTML .. '<p ' ..
                   ternary(obstruction > 0, 'class="on"', 'class="off"') ..
                   '>Slot ' .. i .. ': ' .. obstruction .. '%</p>\n'
end

local css = [[
<style>
 .zen {
  display: float;
  justify-content: left;
 }

 .left-hud {
  display: float;
  justify-content: space-around;
  align-items: center;
  background-color: #34495E50;
  border-color: #333333;
  border-radius: 10px;
  width: 30vw;
  height: 5vh;
  padding: 10px 30px;
  overflow: none;
 }

 p {
  font-size: 20px;
  color: black;
 }

 .on {
  background-color: red;
 }

 .off {
  background-color: #6080BF;
 }
</style>
]]

local html = [[
<div class="zen">
 <div class="left-hud">
  ]] .. slotHTML .. [[
 </div>
</div>]]

print(html)

system.setScreen(css .. html)
system.showScreen(1)
