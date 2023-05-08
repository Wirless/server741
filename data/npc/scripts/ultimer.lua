random_items = { 
{5,5546,1}, --  0.5% to get 
{10,5811,1}, --  1% to get 
{40,5541,1}, -- 4% to get 
{80,5761,10}, -- 8% to get
{120,2157,50}, -- 12% to get
{200,5817,1}, -- 20% to get 
{350,5813,1}, -- 35% to get 
{400,5818,1}
} 
PRESENT_STORAGE = 44368 -- storage ID 



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
	if(getPlayerLevel(cid) >= 99) then
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
            npcHandler:say('Sure take this I got ' .. count .. getItemNameById(reward) .. ' for you.', cid) 
        else 
            npcHandler:say('I gave you a present already.', cid)
        end 
	else
		npcHandler:say('You need at least level 100 to get your present daily reward!', cid) 
	end
    else 
        npcHandler:say('Come back when you are ready.', cid) 
    end 
    npcHandler:resetNpc() 
    return true 
end 
  
npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|. I reward high level 100 players just say present.") 

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false}) 
local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true}) 

local node = keywordHandler:addKeyword({'pre'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you want to receive your thing?'}) 
    node:addChildKeywordNode(yesNode) 
    node:addChildKeywordNode(noNode) 
npcHandler:addModule(FocusModule:new())