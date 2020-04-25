chance    = 45
base      = 0.0000001
nextbet   = base
streakcnt = 0
resetseed()
rec       = {0}
rec10     = {0}
rec10cnt  = 0
rec25     = {0}
rec25cnt  = 0
rec33     = {0}
rec33cnt  = 0
rec50     = {0}
rec50cnt  = 0
rec66     = {0}
rec66cnt  = 0
a         = 0
initcnt   = 0
mult      = 0
maxstreak = 1
--10x function
  function add (t)
      local sum = 0
      for i,v in ipairs(t) do
        sum = sum + v
      end
      return sum
    end
  --5x function

function dobet()

    chance  = 33
    nextbet = base
    bethigh = true
mult = 1.55
    initcnt+=1
  

    --1.5x routine
    if lastBet.roll>66 then
        table.insert(rec66,1,"1")
    else table.insert(rec66,1,"0")
    end
    rec66cnt = 33/((add(rec66)/#rec66)*100)    
    if (rec66cnt)>=maxstreak then 
      --  if win then 
      chance = 66 mult=3.5 bethigh=false end 
            --end
            table.remove(rec66,31)
        --2x routine
    if lastBet.roll>50 then
            table.insert(rec50,1,"1")
        else table.insert(rec50,1,"0")
    end
        rec50cnt = 50/((add(rec50)/#rec50)*100)
        if (rec50cnt)>=maxstreak then 
            -- if win then 
            chance = 50 mult=2.5 bethigh=false end  
            --end
        table.remove(rec50,51) 

        --3x routine
       if lastBet.roll>33 then
        table.insert(rec33,1,"1")
    else table.insert(rec33,1,"0")
    end
    rec33cnt = 66/((add(rec33)/#rec33)*100)
    if (rec33cnt)>=maxstreak then
        --  if win then 
        chance = 33 mult=2 bethigh=false end 
           --end
    table.remove(rec33,67)
        
   --5x routine
       if lastBet.roll>25 then
           table.insert(rec25,1,"1")
       else table.insert(rec25,1,"0")
    end
       rec25cnt = 75/((add(rec25)/#rec25)*100)    
       if (rec25cnt)>=maxstreak then
           -- if win then 
           chance = 25 mult=1.5 bethigh=false end 
              --end
       table.remove(rec25,76)
 --10x routine
    if lastBet.roll>10 then
        table.insert(rec10,1,"1")
    else table.insert(rec10,1,"0")
    end
    rec10cnt = 90/((add(rec10)/#rec10)*100)    
    if rec10cnt>=maxstreak then
        --if win then
        chance = 10 mult=1.2 bethigh=false end 
           --end
        table.remove(rec10,91)     
   
--bet armount routine


if win then a=0 nextbet=base else
   a       = a-currentprofit 
nextbet = previousbet*mult
   
end
  if nextbet<base then nextbet=base end
--output
if initcnt>90 then
    print("░ 1.5x   ░% "..rec66cnt..".▓█>")
    print("░ 2.0x   ░% "..rec50cnt..".▓█>")
    print("░ 3.0x   ░% "..rec33cnt..".▓█>")
    print("░ 5.0x   ░% "..rec25cnt..".▓█>")
    print("░ 10.0x ░% "..rec10cnt..".▓█>")
end
--init and fixes 

if initcnt<90 then 
    print("░▒▓█ Populating array % "..math.floor(initcnt/90*100).. " █▓▒░") 
        chance  = 45 
        nextbet =0.00000001
    end
    nextbet = math.floor(nextbet*10^8)*0.00000001  
end

    

    
