  -- Script por amoeba13 --

            function onSay(cid, words, param, channel)
                local stt = ""
               
                for pika, tasks in pairs(amoebaTask) do

                for i = 1, (#amoebaTask) do
                    nomes = amoebaTask[i].nomes
                    storages = amoebaTask[i].storagecount
                    counts = amoebaTask[i].count
                    stt = stt.. nomes .. " [" .. taskKills(cid, storages) .. "/" .. counts .. "]\n"
                end        
             
                        break
                end
               return true
            end