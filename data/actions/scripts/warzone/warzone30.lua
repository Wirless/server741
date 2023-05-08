 -- Annihilator script by GriZzm0
 -- Room check and monster removal by Tworn
 
 --Variables used:

 -- player?pos  = The position of the players before teleport.
 -- player?  = Get the thing from playerpos.
 --player?level = Get the players levels.
 --questslevel  = The level you have to be to do this quest.
 --questtatus?  = Get the quest status of the players.
 --demon?pos  = The position of the demons.
 --nplayer?pos  = The position where the players should be teleported too.
 --trash= position to send the demons to when clearing, 1 sqm in middle of nowhere is enough
 -- starting = Upper left point of the annihilator room area.
 -- ending = Bottom right point of the annihilator room area.
 
 --UniqueIDs used:

 --5000 = The switch.
 --5001 = Demon Armor chest.
 --5002 = Magic Sword chest.
 --5003 = Stonecutter Axe chest.
 --5004 = Present chest.


function onUse(cid, item, frompos, item2, topos)
if item.uid == 35301 then
 if item.itemid == 1946 then

 player1pos = {x=32493, y=31773, z=8, stackpos=253}
 player1 = getThingfromPos(player1pos)

 player2pos = {x=32492, y=31773, z=8, stackpos=253}
 player2 = getThingfromPos(player2pos)

 player3pos = {x=32491, y=31773, z=8, stackpos=253}
 player3 = getThingfromPos(player3pos)

 player4pos = {x=32490, y=31773, z=8, stackpos=253}
 player4 = getThingfromPos(player4pos)

 player5pos = {x=32493, y=31774, z=8, stackpos=253}
 player5 = getThingfromPos(player5pos)
 
 player6pos = {x=32492, y=31774, z=8, stackpos=253}
 player6 = getThingfromPos(player6pos)
 
 player7pos = {x=32491, y=31774, z=8, stackpos=253}
 player7 = getThingfromPos(player7pos)
 
 player8pos = {x=32490, y=31774, z=8, stackpos=253}
 player8 = getThingfromPos(player8pos)
 


	 if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 and player5.itemid > 0 and player6.itemid > 0 and player7.itemid > 0 and player8.itemid > 0 then

  player1level = getPlayerLevel(player1.uid)
  player2level = getPlayerLevel(player2.uid)
  player3level = getPlayerLevel(player3.uid)
  player4level = getPlayerLevel(player4.uid)
  player5level = getPlayerLevel(player5.uid)
  player6level = getPlayerLevel(player6.uid)
  player7level = getPlayerLevel(player7.uid)
  player8level = getPlayerLevel(player8.uid)

  questlevel = 30

  if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel and player5level >= questlevel and player6level >= questlevel and player7level >= questlevel and player8level >= questlevel then

	  queststatus1 = getPlayerStorageValue(player1.uid,8160)
	  queststatus2 = getPlayerStorageValue(player2.uid,8160)
	  queststatus3 = getPlayerStorageValue(player3.uid,8160)
	  queststatus4 = getPlayerStorageValue(player4.uid,8160)
	  queststatus5 = getPlayerStorageValue(player5.uid,8160)
	  queststatus6 = getPlayerStorageValue(player6.uid,8160)
	  queststatus7 = getPlayerStorageValue(player7.uid,8160)
	  queststatus8 = getPlayerStorageValue(player8.uid,8160)

	

	nplayer1pos = {x=32482, y=31755, z=8}
	nplayer2pos = {x=32482, y=31756, z=8}
	nplayer3pos = {x=32482, y=31757, z=8}
	nplayer4pos = {x=32482, y=31758, z=8}
	nplayer5pos = {x=32481, y=31755, z=8}
	nplayer6pos	= {x=32481, y=31756, z=8}
	nplayer7pos	= {x=32481, y=31757, z=8}
	nplayer8pos = {x=32481, y=31758, z=8}

   doSendMagicEffect(player1pos,2)
   doSendMagicEffect(player2pos,2)
   doSendMagicEffect(player3pos,2)
   doSendMagicEffect(player4pos,2)
   doSendMagicEffect(player5pos,2)
   doSendMagicEffect(player6pos,2)
   doSendMagicEffect(player7pos,2)
   doSendMagicEffect(player8pos,2)
   

   doTeleportThing(player1.uid,nplayer1pos)
   doTeleportThing(player2.uid,nplayer2pos)
   doTeleportThing(player3.uid,nplayer3pos)
   doTeleportThing(player4.uid,nplayer4pos)
   doTeleportThing(player5.uid,nplayer5pos)
   doTeleportThing(player6.uid,nplayer6pos)
   doTeleportThing(player7.uid,nplayer7pos)
   doTeleportThing(player8.uid,nplayer8pos)

	 doSendMagicEffect(nplayer1pos,10)
	 doSendMagicEffect(nplayer2pos,10)
	 doSendMagicEffect(nplayer3pos,10)
	 doSendMagicEffect(nplayer4pos,10)
	 doSendMagicEffect(nplayer5pos,10)
	 doSendMagicEffect(nplayer6pos,10)
	 doSendMagicEffect(nplayer7pos,10)
	 doSendMagicEffect(nplayer8pos,10)

	 doTransformItem(item.uid,1945)


   else
	doPlayerSendCancel(cid,"Your level is too low")
   end
  else
  doPlayerSendCancel(cid,"You need 8 players in your team.")
  end
 end
 if item.itemid == 1945 then
 doTransformItem(item.uid,1946)
doPlayerSendCancel(cid,"Reseted lever.")
end
end
 return 1
end
