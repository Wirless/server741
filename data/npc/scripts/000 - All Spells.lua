if


elseif msgcontains(msg, 'find person') or msgcontains(msg, 'Find person') then
	spellprice = 80
	spellvoc = {1, 2, 3, 4, 5, 6, 7, 8}
	spellname = "find person"
	spellmagiclevel = 0
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for all vocations")
		talk_state = 0
		end
	
elseif msgcontains(msg, 'light') or msgcontains(msg, 'Light') then
	spellprice = 100
	spellvoc = {1, 2, 3, 4, 5, 6, 7, 8}
	spellname = "light"
	spellmagiclevel = 0
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for all vocations")
		talk_state = 0
		end

elseif msgcontains(msg, 'create food') or msgcontains(msg, 'Create food') then
	spellprice = 150
	spellvoc = {2, 3, 6, 7}
	spellname = "create food"
	spellmagiclevel = 0
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids and paladins.")
		talk_state = 0
		end		
elseif msgcontains(msg, '0') then selfSay("For magic level 0 I have 'find person', 'light' and 'create food'.")


elseif msgcontains(msg, 'magic rope') or msgcontains(msg, 'Magic rope') then
	spellprice = 200
	spellvoc = {1, 2, 3, 4, 5, 6, 7, 8}
	spellname = "magic rope"
	spellmagiclevel = 1
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for all vocations.")
		talk_state = 0
		end		
		
elseif msgcontains(msg, 'light healing') or msgcontains(msg, 'Light healing') then
	spellprice = 170
	spellvoc = {1, 2, 3, 4, 5, 6, 7, 8}
	spellname = "light healing"
	spellmagiclevel = 1
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for all vocations")
		talk_state = 0
		end		

elseif msgcontains(msg, 'light magic missile') or msgcontains(msg, 'Light magic missile') then
	spellprice = 200
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "light magic missile"
	spellmagiclevel = 1
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end
elseif msgcontains(msg, '1') then selfSay("For magic level 1 I have 'magic rope', 'light healing' and 'light magic missile'.")		

		
elseif msgcontains(msg, 'antidote') or msgcontains(msg, 'Antidote') then
	spellprice = 150
	spellvoc = {1, 2, 3, 4, 5, 6, 7, 8}
	spellname = "antidote"
	spellmagiclevel = 2
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for all vocations.")
		talk_state = 0
		end

elseif msgcontains(msg, 'force strike') or msgcontains(msg, 'Force strike') then
	spellprice = 600
	spellvoc = {1, 2, 5, 6}
	spellname = "force strike"
	spellmagiclevel = 2
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'intense healing') or msgcontains(msg, 'Intense healing') then
	spellprice = 350
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "intense healing"
	spellmagiclevel = 2
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end
		
elseif msgcontains(msg, 'poison field') or msgcontains(msg, 'Poison field') then
	spellprice = 300
	spellvoc = {1, 2, 5, 6}
	spellname = "poison field"
	spellmagiclevel = 2
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end		
		
elseif msgcontains(msg, 'conjure arrow') or msgcontains(msg, 'Conjure arrow') then
	spellprice = 450
	spellvoc = {3, 7}
	spellname = "conjure arrow"
	spellmagiclevel = 2
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for paladins.")
		talk_state = 0
		end
elseif msgcontains(msg, '2') then selfSay("For magic level 2 I have 'antidote', 'force strike', 'intense healing' 'poison field' and 'conjure arrow'.")		
		

elseif msgcontains(msg, 'levitate') or msgcontains(msg, 'Levitate') then
	spellprice = 500
	spellvoc = {1, 2, 3, 4, 5, 6, 7, 8}
	spellname = "levitate"
	spellmagiclevel = 3
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for all vocations.")
		talk_state = 0
		end

elseif msgcontains(msg, 'flame strike') or msgcontains(msg, 'Flame strike') then
	spellprice = 800
	spellvoc = {1, 2, 5, 6}
	spellname = "flame strike"
	spellmagiclevel = 3
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'energy strike') or msgcontains(msg, 'Energy strike') then
	spellprice = 800
	spellvoc = {1, 2, 5, 6}
	spellname = "energy strike"
	spellmagiclevel = 3
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'great light') or msgcontains(msg, 'Great light') then
	spellprice = 500
	spellvoc = {1, 2, 3, 4, 5, 6, 7, 8}
	spellname = "great light"
	spellmagiclevel = 3
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for all vocations.")
		talk_state = 0
		end

elseif msgcontains(msg, 'fire field') or msgcontains(msg, 'Fire field') then
	spellprice = 500
	spellvoc = {1, 2, 5, 6}
	spellname = "fire field"
	spellmagiclevel = 3
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'heavy magic missile') or msgcontains(msg, 'Heavy magic missile') then
	spellprice = 600
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "heavy magic missile"
	spellmagiclevel = 3
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end
elseif msgcontains(msg, '3') then selfSay("For magic level 3 I have 'levitate', 'flame strike', 'energy strike', 'great light', 'fire field' and 'heavy magic missile'.")		
		

elseif msgcontains(msg, 'magic shield') or msgcontains(msg, 'magic shield') then
	spellprice = 450
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "magic shield"
	spellmagiclevel = 4
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end

elseif msgcontains(msg, 'haste') or msgcontains(msg, 'Haste') then
	spellprice = 600
	spellvoc = {1, 2, 3, 4, 5, 6, 7, 8}
	spellname = "haste"
	spellmagiclevel = 4
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for all vocations.")
		talk_state = 0
		end

elseif msgcontains(msg, 'challenge') or msgcontains(msg, 'Challenge') then
	spellprice = 2000
	spellvoc = {8}
	spellname = "challenge"
	spellmagiclevel = 4
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for elite knights.")
		talk_state = 0
		end

elseif msgcontains(msg, 'intense healing rune') or msgcontains(msg, 'intense healing rune') then
	spellprice = 600
	spellvoc = {2, 6}
	spellname = "intense healing rune"
	spellmagiclevel = 4
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '4') then selfSay("For magic level 4 I have 'magic shield', 'haste', 'challenge', and 'intense healing rune'.")		
		

elseif msgcontains(msg, 'berserk') or msgcontains(msg, 'Berserk') then
	spellprice = 2500
	spellvoc = {4, 8}
	spellname = "berserk"
	spellmagiclevel = 5
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for knights.")
		talk_state = 0
		end

elseif msgcontains(msg, 'antidote rune') or msgcontains(msg, 'Antidote rune') then
	spellprice = 600
	spellvoc = {2, 6}
	spellname = "antidote rune"
	spellmagiclevel = 5
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'fireball') or msgcontains(msg, 'fireball') then
	spellprice = 800
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "fireball"
	spellmagiclevel = 5
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end

elseif msgcontains(msg, 'energy field') or msgcontains(msg, 'Energy field') then
	spellprice = 700
	spellvoc = {1, 2, 5, 6}
	spellname = "energy field"
	spellmagiclevel = 5
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'poison arrow') or msgcontains(msg, 'Poison arrow') then
	spellprice = 700
	spellvoc = {3, 7}
	spellname = "poison arrow"
	spellmagiclevel = 5
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for paladins.")
		talk_state = 0
		end
elseif msgcontains(msg, '5') then selfSay("For magic level 5 I have 'berserk', 'antidote rune', fireball', 'energy field' and 'poison arrow'.")
		
		
elseif msgcontains(msg, 'destroy field') or msgcontains(msg, 'Destroy field') then
	spellprice = 350
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "destroy field"
	spellmagiclevel = 6
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end

elseif msgcontains(msg, 'conjure bolt') or msgcontains(msg, 'Conjure bolt') then
	spellprice = 750
	spellvoc = {3, 7}
	spellname = "conjure bolt"
	spellmagiclevel = 6
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for paladins.")
		talk_state = 0
		end
elseif msgcontains(msg, '6') then selfSay("For magic level 6 I have 'destroy field' and 'conjure bolt''.")
		
		
elseif msgcontains(msg, 'fire wave') or msgcontains(msg, 'Fire wave') then
	spellprice = 850
	spellvoc = {1, 5}
	spellname = "fire wave"
	spellmagiclevel = 7
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end

elseif msgcontains(msg, 'heal friend') or msgcontains(msg, 'Heal friend') then
	spellprice = 800
	spellvoc = {2, 6}
	spellname = "heal friend"
	spellmagiclevel = 7
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'envenom') or msgcontains(msg, 'Envenom') then
	spellprice = 1000
	spellvoc = {2, 6}
	spellname = "envenom"
	spellmagiclevel = 7
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'animate dead') or msgcontains(msg, 'Animate dead') then
	spellprice = 1200
	spellvoc = {1, 2, 5, 6}
	spellname = "animate dead"
	spellmagiclevel = 7
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '7') then selfSay("For magic level 7 I have 'fire wave', 'heal friend', 'envenom' and 'animate dead'.")
		
		
elseif msgcontains(msg, 'ultimate healing') or msgcontains(msg, 'Ultimate healing') then
	spellprice = 1000
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "ultimate healing"
	spellmagiclevel = 8
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end

elseif msgcontains(msg, 'strong haste') or msgcontains(msg, 'Strong haste') then
	spellprice = 1300
	spellvoc = {1, 2, 5, 6}
	spellname = "strong haste"
	spellmagiclevel = 8
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'desintegrate') or msgcontains(msg, 'Desintegrate') then
	spellprice = 900
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "desintegrate"
	spellmagiclevel = 8
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end

elseif msgcontains(msg, 'poison bomb') or msgcontains(msg, 'Poison bomb') then
	spellprice = 1000
	spellvoc = {2, 6}
	spellname = "poison bomb"
	spellmagiclevel = 8
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '8') then selfSay("For magic level 8 I have 'ultimate healing', 'strong haste', 'desintegrate' and 'poison bomb'.")
		
		
elseif msgcontains(msg, 'great fireball') or msgcontains(msg, 'Great fireball') then
	spellprice = 1200
	spellvoc = {1, 2, 5, 6}
	spellname = "great fireball"
	spellmagiclevel = 9
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'firebomb') or msgcontains(msg, 'Firebomb') then
	spellprice = 1500
	spellvoc = {1, 2, 5, 6}
	spellname = "firebomb"
	spellmagiclevel = 9
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '9') then selfSay("For magic level 9 I have 'great fireball' and 'firebomb'.")
		
		
elseif msgcontains(msg, 'creature illusion') or msgcontains(msg, 'Creature illusion') then
	spellprice = 1000
	spellvoc = {1, 2, 5, 6}
	spellname = "creature illusion"
	spellmagiclevel = 10
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'energy beam') or msgcontains(msg, 'Energy beam') then
	spellprice = 1000
	spellvoc = {1, 5}
	spellname = "energy beam"
	spellmagiclevel = 10
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end

elseif msgcontains(msg, 'convince creature') or msgcontains(msg, 'convince creature') then
	spellprice = 1500
	spellvoc = {2, 6}
	spellname = "convince creature"
	spellmagiclevel = 10
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'explosive arrow') or msgcontains(msg, 'Explosive arrow') then
	spellprice = 1000
	spellvoc = {3, 7}
	spellname = "explosive arrow"
	spellmagiclevel = 10
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for royal paladins.")
		talk_state = 0
		end
elseif msgcontains(msg, '10') then selfSay("For magic level 10 I have 'creature illusion', 'energy beam', 'convince creature' and 'explosive arror''.")
		
		
elseif msgcontains(msg, 'ultimate healing rune') or msgcontains(msg, 'Ultimate healing rune') then
	spellprice = 1500
	spellvoc = {2, 6}
	spellname = "ultimate healing rune"
	spellmagiclevel = 11
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'chameleon') or msgcontains(msg, 'Chameleon') then
	spellprice = 1300
	spellvoc = {2, 6}
	spellname = "chameleon"
	spellmagiclevel = 11
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'poison wall') or msgcontains(msg, 'poison wall') then
	spellprice = 1600
	spellvoc = {1, 2, 5, 6}
	spellname = "poison wall"
	spellmagiclevel = 11
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '11') then selfSay("For magic level 11 I have 'ultimate healing rune', 'chameleon' and 'poison wall'.")
		
		
elseif msgcontains(msg, 'cancel invisibility') or msgcontains(msg, 'Cancel invisibility') then
	spellprice = 1600
	spellvoc = {1, 5}
	spellname = "cancel invisibility"
	spellmagiclevel = 12
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end

elseif msgcontains(msg, 'ultimate light') or msgcontains(msg, 'Ultimate light') then
	spellprice = 1600
	spellvoc = {1, 2, 5, 6}
	spellname = "ultimate light"
	spellmagiclevel = 12
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'explosion') or msgcontains(msg, 'Explosion') then
	spellprice = 1800
	spellvoc = {1, 2, 5, 6}
	spellname = "explosion"
	spellmagiclevel = 12
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '12') then selfSay("For magic level 12 I have 'cancel invisibility', 'ultimate light' and 'explosion'.")
		
		
elseif msgcontains(msg, 'wild growth') or msgcontains(msg, 'wild growth') then
	spellprice = 2000
	spellvoc = {6}
	spellname = "wild growth"
	spellmagiclevel = 13
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for elder druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'soul fire') or msgcontains(msg, 'Soul fire') then
	spellprice = 1800
	spellvoc = {1, 2, 5, 6}
	spellname = "soul fire"
	spellmagiclevel = 13
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end

elseif msgcontains(msg, 'fire wall') or msgcontains(msg, 'fire wall') then
	spellprice = 2000
	spellvoc = {1, 2, 5, 6}
	spellname = "fire wall"
	spellmagiclevel = 13
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '13') then selfSay("For magic level 13 I have 'wild growth', 'soul fire' and 'fire wall'.")
		
		
elseif msgcontains(msg, 'great energy beam') or msgcontains(msg, 'Great energy beam') then
	spellprice = 1800
	spellvoc = {1, 5}
	spellname = "great energy beam"
	spellmagiclevel = 14
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end

elseif msgcontains(msg, 'magic wall') or msgcontains(msg, 'Magic wall') then
	spellprice = 2100
	spellvoc = {1, 5}
	spellname = "magic wall"
	spellmagiclevel = 14
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end

elseif msgcontains(msg, 'power bolt') or msgcontains(msg, 'power bolt') then
	spellprice = 2000
	spellvoc = {7}
	spellname = "power bolt"
	spellmagiclevel = 14
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for royal paladins.")
		talk_state = 0
		end
elseif msgcontains(msg, '14') then selfSay("For magic level 14 I have 'great energy beam', 'magic wall' and 'power bolt'.")
		
		
elseif msgcontains(msg, 'invisible') or msgcontains(msg, 'Invisible') then
	spellprice = 1000
	spellvoc = {1, 2, 3, 5, 6, 7}
	spellname = "invisible "
	spellmagiclevel = 15
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers, druids and paladins.")
		talk_state = 0
		end
		
elseif msgcontains(msg, 'undead legion') or msgcontains(msg, 'undead legion') then
	spellprice = 2000
	spellvoc = {2, 6}
	spellname = "undead legion"
	spellmagiclevel = 15
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end
		
elseif msgcontains(msg, '15') then selfSay("For magic level 15 I have 'invisible'.")
		
		
elseif msgcontains(msg, 'summon creature') or msgcontains(msg, 'Summon creature') then
	spellprice = 2000
	spellvoc = {1, 2, 5, 6}
	spellname = "summon creature"
	spellmagiclevel = 16
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '16') then selfSay("For magic level 16 I have 'summon creature'.")
		
		
elseif msgcontains(msg, 'energy bomb') or msgcontains(msg, 'Energy bomb') then
	spellprice = 2300
	spellvoc = {1, 5}
	spellname = "energy bomb"
	spellmagiclevel = 18
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end

elseif msgcontains(msg, 'energy wall') or msgcontains(msg, 'Energy wall') then
	spellprice = 2500
	spellvoc = {1, 2, 5, 6}
	spellname = "energy wall"
	spellmagiclevel = 18
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers and druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '18') then selfSay("For magic level 18 I have 'energy bomb' and 'energy wall'.")
		
		
elseif msgcontains(msg, 'mass healing') or msgcontains(msg, 'mass healing') then
	spellprice = 2200
	spellvoc = {2, 6}
	spellname = "mass healing"
	spellmagiclevel = 19
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '19') then selfSay("For magic level 19 I have 'mass healing'.")		

		
elseif msgcontains(msg, 'energy wave') or msgcontains(msg, 'Energy wave') then
	spellprice = 2500
	spellvoc = {1, 5}
	spellname = "energy wave"
	spellmagiclevel = 20
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end
elseif msgcontains(msg, '20') then selfSay("For magic level 20 I have 'energy wave'.")
		
		
elseif msgcontains(msg, 'enchant staff') or msgcontains(msg, 'Enchant staff') then
	spellprice = 2200
	spellvoc = {5}
	spellname = "enchant staff"
	spellmagiclevel = 22
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for master sorcerers.")
		talk_state = 0
		end
elseif msgcontains(msg, '22') then selfSay("For magic level 22 I have 'enchant staff'.")


elseif msgcontains(msg, 'sudden death') or msgcontains(msg, 'Sudden death') then
	spellprice = 3000
	spellvoc = {1, 5}
	spellname = "sudden death"
	spellmagiclevel = 25
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end
elseif msgcontains(msg, '25') then selfSay("For magic level 25 I have 'sudden death'.")
		
		
elseif msgcontains(msg, 'poison storm') or msgcontains(msg, 'poison storm') then
	spellprice = 3400
	spellvoc = {2, 6}
	spellname = "poison storm"
	spellmagiclevel = 28
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '28') then selfSay("For magic level 28 I have 'posion storm'.")
		
		
elseif msgcontains(msg, 'paralyze') or msgcontains(msg, 'Paralyze') then
	spellprice = 1900
	spellvoc = {6}
	spellname = "paralyze"
	spellmagiclevel = 35
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for elder druids.")
		talk_state = 0
		end
elseif msgcontains(msg, '35') then selfSay("For magic level 35 I have 'paralyze'.")

		
elseif msgcontains(msg, 'ultimate explosion') or msgcontains(msg, 'Ultimate explosion') then
	spellprice = 8000
	spellvoc = {1, 5}
	spellname = "ultimate explosion"
	spellmagiclevel = 40
		if isInArray(spellvoc, getPlayerVocation(cid)) == 1 then
		selfSay("Do you want to learn the spell '".. spellname .."' for ".. spellprice .." gold?")
		talk_state = 8754
		else
		selfSay("I am sorry but this spell is only for sorcerers.")
		talk_state = 0
		end
elseif msgcontains(msg, '40') then selfSay("For magic level 40 I have 'ultimate explosion'.")





















warning for problems with:
intense healing - intense healing rune
Antidote - Antidote rune
Fireball - Great fireball
Energy beam - Great Energy Beam
Explosion - Ultimate explosion
end