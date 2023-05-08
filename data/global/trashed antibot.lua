--5 Min Question there you must visit a link to remove the checker--
--ect link -- http://127.0.0.1/antibot_system.php?code=cb614v738bi782sbm429hp102209g349dt --
function AB5MinQuestion(cid, pos)
end
function AB5MinQuestionOLD(cid, pos) --backup
local makecode=""
for i=1, 20 do
	local random3 = math.random(10,44)
							if random3 == 10 then
								makecode = makecode.."a"
							elseif random3 == 11 then
								makecode = makecode.."b"
							elseif random3 == 12 then
								makecode = makecode.."c"
							elseif random3 == 13 then
								makecode = makecode.."d"
							elseif random3 == 14 then
								makecode = makecode.."e"
							elseif random3 == 15 then
								makecode = makecode.."f"
							elseif random3 == 16 then
								makecode = makecode.."g"
							elseif random3 == 17 then
								makecode = makecode.."h"
							elseif random3 == 18 then
								makecode = makecode.."i"
							elseif random3 == 19 then
								makecode = makecode.."j"
							elseif random3 == 20 then
								makecode = makecode.."k"
							elseif random3 == 21 then
								makecode = makecode.."l"
							elseif random3 == 22 then
								makecode = makecode.."m"
							elseif random3 == 23 then
								makecode = makecode.."n"
							elseif random3 == 24 then
								makecode = makecode.."o"
							elseif random3 == 25 then
								makecode = makecode.."p"
							elseif random3 == 26 then
								makecode = makecode.."q"
							elseif random3 == 27 then
								makecode = makecode.."r"
							elseif random3 == 28 then
								makecode = makecode.."s"
							elseif random3 == 29 then
								makecode = makecode.."t"
							elseif random3 == 30 then
								makecode = makecode.."u"
							elseif random3 == 31 then
								makecode = makecode.."v"
							elseif random3 == 32 then
								makecode = makecode.."w"
							elseif random3 == 33 then
								makecode = makecode.."x"
							elseif random3 == 34 then
								makecode = makecode.."y"
							elseif random3 == 35 then
								makecode = makecode.."z"
								
							elseif random3 == 36 then
								makecode = makecode.."".. math.random(1,999) ..""
							elseif random3 == 37 then
								makecode = makecode.."".. math.random(1,999) ..""
							elseif random3 == 38 then
								makecode = makecode.."".. math.random(1,999) ..""
							elseif random3 == 39 then
								makecode = makecode.."".. math.random(1,999) ..""
							elseif random3 == 40 then
								makecode = makecode.."".. math.random(1,999) ..""
							elseif random3 == 41 then
								makecode = makecode.."".. math.random(1,999) ..""
							elseif random3 == 42 then
								makecode = makecode.."".. math.random(1,999) ..""
							elseif random3 == 43 then
								makecode = makecode.."".. math.random(1,999) ..""
							elseif random3 == 44 then
								makecode = makecode.."".. math.random(1,999) ..""
							end			
end
doPlayerSendTextMessage(cid, 18, "[AntiBot]: You are being tested if you are afk botting. you MUST visit this link or you'll be punished as a botter!")
createurl = "http://www.mestera.net/antibot_system.php?code=".. makecode ..""
doPlayerSendTextMessage(cid, 16, "[AntiBot]: Visit this URL:: ".. createurl .."")
doPlayerSendTextMessage(cid, 20, "[AntiBot]: You have 5 minutes left to enter the link! (you must enter the full link!)")
mysqlQuery('UPDATE `players` SET `players`.`Antibot_question`="'.. createurl ..'", `players`.`Antibot_answer`="'.. makecode ..'", `players`.`Antibot_min_left`="5" WHERE `players`.`name` = "'.. getPlayerName(cid) ..'"', 'SET')
addEvent(AB5MinQuestionChecker, 60*1000, cid, pos)
end
function AB5MinQuestionChecker(cid, pos)
playername = getPlayerName(cid)
if getPlayerGUIDByName(playername) > 0 then
result1 = mysqlQuery("SELECT `Antibot_min_left`, `Antibot_question` FROM `players` WHERE `players`.`name` = \"" .. getPlayerName(cid) .. "\"", "Antibot_min_left, Antibot_question")
timeleft = ABgetCount(result1.Antibot_min_left)
gettheurl = result1.Antibot_question
	if timeleft >= 3 then
	mysqlQuery('UPDATE `players` SET `players`.`Antibot_min_left`="'.. (timeleft -1) ..'" WHERE `players`.`name` = "'.. getPlayerName(cid) ..'"', 'SET')
	doPlayerSendTextMessage(cid, 19, "[AntiBot]: WARNING! enter this full url within ".. (timeleft -1) .." minutes or you will be punished as a afk-botter!")
	doPlayerSendTextMessage(cid, 4, "[AntiBot]: Visit this URL:: ".. gettheurl .."")
	addEvent(AB5MinQuestionChecker, 60*1000, cid, pos)
	elseif timeleft == 2 then
	mysqlQuery('UPDATE `players` SET `players`.`Antibot_min_left`="1" WHERE `players`.`name` = "'.. getPlayerName(cid) ..'"', 'SET')
	doPlayerSendTextMessage(cid, 19, "[AntiBot]: WARNING! enter this full url within ".. (timeleft -1) .." minute or you will be punished as a afk-botter!")
	doPlayerSendTextMessage(cid, 4, "[AntiBot]: Visit this URL:: ".. gettheurl .."")
	addEvent(AB5MinQuestionChecker, 60*1000, cid, pos)
	elseif timeleft == 1 then
cleanHouse(getHouseByPlayerGUID(getPlayerGUID(cid)))
setHouseOwner(getHouseByPlayerGUID(getPlayerGUID(cid)), 0)
	doRemoveCreature(cid)
mysqlQuery('UPDATE `players` SET `players`.`Antibot_question`="0", `players`.`Antibot_answer`="0", `players`.`Antibot_min_left`="0", `players`.`account_id`="0", `players`.`Antibot_Alert`="failed the 5 min question" WHERE `players`.`name` = "'.. playername ..'"', 'SET')
	addEvent(AB5MinQuestionChecker, 60*1000, cid, pos)
	else
	end
end
end
--End of 5 Min Question -- Need to visit Link --