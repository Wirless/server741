random_items = { 
{5,5546,1}, --  0.5% to get boots of haste
{10,5540,1}, --  1% to get teddy bear
{40,2157,100}, -- 4% to get vampire shield
{80,2157,50}, -- 8% to get knight armor 
{120,2157,20}, -- 12% to get crown armor
{200,2157,15}, -- 20% to get war hammer
{350,2157,10}, -- 35% to get crown shield
{400,5541,1}, -- 40% to get knight armor
{500,5748,1}, -- 50% to get fire sword
{1000,5749,30} -- 100% to get 3k
} 
PRESENT_STORAGE = 44304 -- storage ID 



local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 


function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end 
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end 
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end 
function onThink()                             npcHandler:onThink()                         end 

function santaNPC(cid, message, keywords, parameters, node) 
	if(npcHandler.focus ~= cid) then
		return false
	end
    if (parameters.present == true) then 
	if(getPlayerLevel(cid) >= 20) then
        if (getPlayerStorageValue(cid, PRESENT_STORAGE) < 1) then 
            local item = {} 
            local reward = 0 
            local count = "" 
            for i = 1, #random_items do 
                item = random_items[i] 
                if (math.random(0,999) < item[1]) then 
                    reward = item[2] 
                    subType = item[3] 
                    if subType > 1 then 
                        count = subType .. " " 
                    end 
                    break 
                end 
            end 
            doPlayerAddItem(cid, reward, subType) 
            setPlayerStorageValue(cid, PRESENT_STORAGE, 1) 
            npcHandler:say('HO HO HO! You were good like a little dwarf this year! I got ' .. count .. getItemNameById(reward) .. ' for you.', cid) 
        else 
            npcHandler:say('I gave you a present already.', cid)
        end 
	else
		npcHandler:say('You need at least level 20 to get your present!', cid) 
	end
    else 
        npcHandler:say('Come back when you start behaving good.', cid) 
    end 
    npcHandler:resetNpc() 
    return true 
end 
  
npcHandler:setMessage(MESSAGE_GREET, "Merry Christmas |PLAYERNAME|. I'm Santa Claus. I got presents for good children.") 

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false}) 
local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true}) 

local node = keywordHandler:addKeyword({'pre'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Were you good this year?'}) 
    node:addChildKeywordNode(yesNode) 
    node:addChildKeywordNode(noNode) 
npcHandler:addModule(FocusModule:new())