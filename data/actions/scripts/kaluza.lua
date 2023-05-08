local ITEM_RUM_FLASK = 5553

local TYPE_EMPTY = 0
local TYPE_WATER = 1
local TYPE_BLOOD = 2
local TYPE_BEER = 3
local TYPE_SLIME = 4
local TYPE_LEMONADE = 5
local TYPE_MILK = 6
local TYPE_MANA_FLUID = 7
local TYPE_LIFE_FLUID = 10
local TYPE_OIL = 11
local TYPE_URINE = 13
local TYPE_COCONUT_MILK = 14
local TYPE_WINE = 15
local TYPE_MUD = 19
local TYPE_FRUIT_JUICE = 21
local TYPE_LAVA = 26
local TYPE_RUM = 27
local TYPE_SWAMP = 28
local TYPE_TEA = 35

local oilLamps = {[2046] = 2044}
local casks = {[1771] = TYPE_WATER, [1772] = TYPE_BEER, [1773] = TYPE_WINE}
local alcoholDrinks = {TYPE_BEER, TYPE_WINE, TYPE_RUM}
local poisonDrinks = {TYPE_SLIME, TYPE_SWAMP}

local drunk = createConditionObject(CONDITION_DRUNK)
setConditionParam(drunk, CONDITION_PARAM_TICKS, 60000)

local poison = createConditionObject(CONDITION_POISON)
setConditionParam(poison, CONDITION_PARAM_DELAYED, true) -- Condition will delay the first damage from when it's added
setConditionParam(poison, CONDITION_PARAM_MINVALUE, -50) -- Minimum damage the condition can do at total
setConditionParam(poison, CONDITION_PARAM_MAXVALUE, -120) -- Maximum damage
setConditionParam(poison, CONDITION_PARAM_STARTVALUE, -5) -- The damage the condition will do on the first hit
setConditionParam(poison, CONDITION_PARAM_TICKINTERVAL, 4000) -- Delay between damages
setConditionParam(poison, CONDITION_PARAM_FORCEUPDATE, true) -- Re-update condition when adding it(ie. min/max value)

local burn = createConditionObject(CONDITION_FIRE)
setConditionParam(burn, CONDITION_PARAM_DELAYED, true) -- Condition will delay the first damage from when it's added
setConditionParam(burn, CONDITION_PARAM_MINVALUE, -70) -- Minimum damage the condition can do at total
setConditionParam(burn, CONDITION_PARAM_MAXVALUE, -150) -- Maximum damage
setConditionParam(burn, CONDITION_PARAM_STARTVALUE, -10) -- The damage the condition will do on the first hit
setConditionParam(burn, CONDITION_PARAM_TICKINTERVAL, 10000) -- Delay between damages
setConditionParam(burn, CONDITION_PARAM_FORCEUPDATE, true) -- Re-update condition when adding it(ie. min/max value)

function onUse(cid, item, fromPosition, itemEx, toPosition)
	
	if(item.type == TYPE_MANA_FLUID) then
			doCreatureSay(cid, "Mmmmm Pool of mana fluid...", TALKTYPE_SAY)
			doSendMagicEffect(toPosition, CONST_ME_MAGIC_BLUE)
			doCreatureAddMana(cid, math.random(10, 15))
	doRemoveItem(item.uid, 1)
	
	else
	doPlayerSendCancel(cid, "It is empty.")
end
end
