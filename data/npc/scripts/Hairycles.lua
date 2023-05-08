-- NPC Converter System - developed by Utroz <utroz@oakcoders.com>
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)	npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg) end
function onThink()	npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me fine, me fine.'})
keywordHandler:addKeyword({'advice'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You stay away from other apes. We not like foreigners. Especially with so little hair.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me great wizard. Me great doctor. Me know many plants. Me old and me have seen many things.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me is Hairycles.'})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You look to suns or moon and time you know.'})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me not help you can. Other apes would get mad at me.'})
keywordHandler:addKeyword({'jungle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Jungle is dangerous. Jungle also provides us food. Take care when in jungle and safe you be.'})
keywordHandler:addKeyword({'city'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'City now our is. Chasing away evil snakemen.'})
keywordHandler:addKeyword({'snakemen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Evil snakemen mean to apes and making them work and holding them captive since apes can think. But then Spartaky came.'})
keywordHandler:addKeyword({'spartaky'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He great ape was. He fled to jungle, taught other apes of snakemen secrets. Came back with other apes and together we chased snake people away. Made city our home.'})
keywordHandler:addKeyword({'port hope'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Strange hairless ape people there live. We go and get funny things from strange people.'})
keywordHandler:addKeyword({'ape people'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We be kongra, sibang and merlkin. Strange hairless ape people live in city called Port Hope.'})
keywordHandler:addKeyword({'kongra'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Kongra verry strong. Kongra verry angry verry fast. Take care when kongra comes. Better climb on highest tree.'})
keywordHandler:addKeyword({'sibang'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Sibang verry fast and funny. Sibang good gather food. Sibang know jungle well.'})
keywordHandler:addKeyword({'merlkin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Merlkin we are. Merlkin verry wise, merlkin learn many things quick. Teach other apes things a lot. Making heal and making magic.'})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We see many things and learning quick. Merlkin magic learn quick, quick. We just watch and learn. Sometimes we try and learn.'})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We weapons not need much. Take what is around we do. Tools we more need.'})
keywordHandler:addKeyword({'tools'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Lot of tools snakemen left when run away. But tools go break. New tools we get where we find. Like taking banana.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Me know Tibia is all we see.'})
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'You look for food and rest.'})
keywordHandler:addKeyword({'banana'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Banana is good. Is magic fruit. Banana makes happy. Banana means life. Banana is everything.'})
keywordHandler:addKeyword({'language'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Strange hairless ape in loincloth came here. Zantar his name was. Brought many banana. We him liked. He here lived. Taught Hairycles funny language.'})
npcHandler:addModule(FocusModule:new())
