local config =
{
makeExhaustion = 2, --make exhaust? put the exhaust time in seconds or false if it won't make exhaustion
exhaustionStorage = 53700,
}


local FOODS, MAX_FOOD = {
	[2328] = {84, "Gulp."},  [2362] = {48, "Yum."}, [2666] = {180, "Munch."}, [2667] = {144, "Munch."},
	[2668] = {120, "Mmmm."}, [2669] = {204, "Munch."}, [2670] = {48, "Gulp."}, [2671] = {360, "Chomp."},
	[2672] = {720, "Chomp."}, [2673] = {60, "Yum."}, [2674] = {72, "Yum."}, [2675] = {156, "Yum."},
	[2676] = {96, "Yum."}, [2677] = {12, "Yum."}, [2678] = {216, "Slurp."}, [2679] = {12, "Yum."},
	[2680] = {24, "Yum."}, [2681] = {108, "Yum."}, [2682] = {240, "Yum."}, [2683] = {204, "Munch."},
	[2684] = {60, "Crunch."}, [2685] = {72, "Munch."}, [2686] = {108, "Crunch."}, [2687] = {24, "Crunch."},
	[2688] = {24, "Mmmm."}, [2689] = {120, "Crunch."}, [2690] = {72, "Crunch."}, [2691] = {96, "Crunch."},
	[2695] = {72, "Gulp."}, [2696] = {108, "Smack."}, [8112] = {108, "Urgh."}, [2787] = {108, "Crunch."},
	[2788] = {48, "Munch."}, [2789] = {264, "Munch."}, [2790] = {360, "Crunch."}, [2791] = {108, "Crunch."},
	[2792] = {72, "Crunch."}, [2793] = {144, "Crunch."}, [2794] = {36, "Crunch."}, [2795] = {432, "Crunch."},
	[2796] = {300, "Crunch."}
}, 1200

function onUse(cid, item, fromPosition, itemEx, toPosition)
if (config.makeExhaustion ~= false and tonumber(config.makeExhaustion)) then
	local food = FOODS[item.itemid]
	if(food == nil) then
		return false
	end

	local size = food[1]
	if(getPlayerFood(cid) + size > MAX_FOOD) then
		doPlayerSendCancel(cid, "You are full. Regenerating instead")
		doCreatureAddMana(cid, size/70)
		doCreatureAddHealth(cid, size/50)
		doCreatureSay(cid, "Omnomnom...", TALKTYPE_SAY)
		doRemoveItem(item.uid, 1)
		return true
	end

	doPlayerFeed(cid, size)
	doRemoveItem(item.uid, 1)
	return true
	else
	return false
end
end
