chance    = 45
base      = 0.0000001
nextbet   = base
streakcnt = 0
resetseed()
rec      = {0}
rec10    = {0}
rec10cnt = 0
rec25    = {0}
rec25cnt = 0
rec33    = {0}
rec33cnt = 0
rec50    = {0}
rec50cnt = 0
rec66    = {0}
rec66cnt = 0
a        = 0
initcnt  = 0

--10x function
  function add10 (t)
      local sum = 0
      for i,v in ipairs(rec10) do
        sum = sum + v
      end
      return sum
    end
  --5x function
  function add25 (t)
      local sum = 0
      for i,v in ipairs(rec25) do
        sum = sum + v
      end
      return sum
    end
  --3x function
    function add33 (t)
      local sum = 0
      for i,v in ipairs(rec33) do
        sum = sum + v
      end
      return sum
    end
    --2x function
    function add50 (t)
      local sum = 0
      for i,v in ipairs(rec50) do
        sum = sum + v
      end
      return sum
    end
    --1.5x function
    function add66 (t)
      local sum = 0
      for i,v in ipairs(rec66) do
        sum = sum + v
      end
      return sum
    end

function dobet()
if win then
    chance  = 33
    nextbet = base
    bethigh = true
end
    initcnt+=1
  

    --1.5x routine
    if lastBet.roll>66 then
        table.insert(rec66,1,"1")
    else table.insert(rec66,1,"0")
    end
    rec66cnt = ((add66(rec66)/#rec66))    
    if math.floor(#rec66/rec66cnt)>=103 then 
      --  if win then 
            chance = 66 bethigh=false end 
            --end
            table.remove(rec66,31)
        --2x routine
    if lastBet.roll>50 then
            table.insert(rec50,1,"1")
        else table.insert(rec50,1,"0")
    end
        rec50cnt = ((add50(rec50)/#rec50))
        if math.floor(#rec50/rec50cnt)>=105 then 
            -- if win then 
                chance = 50 bethigh=false end  
            --end
        table.remove(rec50,51) 

        --3x routine
       if lastBet.roll>33 then
        table.insert(rec33,1,"1")
    else table.insert(rec33,1,"0")
    end
    rec33cnt = ((add33(rec33)/#rec33))
    if math.floor(#rec33/rec33cnt)>=106 then
        --  if win then 
           chance = 33 bethigh=false end 
           --end
    table.remove(rec33,67)
        
   --5x routine
       if lastBet.roll>25 then
           table.insert(rec25,1,"1")
       else table.insert(rec25,1,"0")
    end
       rec25cnt = ((add25(rec25)/#rec25))    
       if math.floor(#rec25/rec25cnt)>=107 then
           -- if win then 
              chance = 25 bethigh=false end 
              --end
       table.remove(rec25,76)
 --10x routine
    if lastBet.roll>10 then
        table.insert(rec10,1,"1")
    else table.insert(rec10,1,"0")
    end
    rec10cnt = ((add10(rec10)/#rec10))    
    if math.floor(#rec10/rec10cnt)>=110 then
        --if win then
           chance = 10 bethigh=false end 
           --end
        table.remove(rec10,91)     
   
--bet armount routine


if win then a=0 nextbet=base else
   a       = a-currentprofit 
   nextbet = (a/math.floor(50/chance))
 
   if (chance)==66 then nextbet=previousbet*3 end
end

  if nextbet<base then nextbet=base end
--output
if initcnt>90 then
print("░ 1.5x   ░% "..math.floor(#rec66/rec66cnt)..".▓█>")
print("░ 2.0x   ░% "..math.floor(#rec50/rec50cnt)..".▓█>")
print("░ 3.0x   ░% "..math.floor(#rec33/rec33cnt)..".▓█>")
print("░ 5.0x   ░% "..math.floor(#rec25/rec25cnt)..".▓█>")
print("░ 10.0x ░% "..math.floor(#rec10/rec10cnt)..".▓█>")
end
--init and fixes 

if initcnt<90 then 
    print("░▒▓█ Populating array % "..math.floor(initcnt/90*100).. " █▓▒░") 
        chance  = 45 
        nextbet =0.00000001
    end

end

    
