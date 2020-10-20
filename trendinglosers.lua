prebet = 0.00000001--prebet (often minimum bet)
div    = 1000 --balance divisor for basebet
mod    = 0.9 --sensitivity
mod2   = 4 --sample size multiple
target = balance*2
--dont change below
chance    = 55
basebet   = balance/div
streakcnt = 0
resetseed()
resetstats()
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
nextbet  = basebet
multi    = 0
payout   = 0
nextbet  = prebet
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
    basebet = balance/div
    if win then chance=55 bethigh=false end

    initcnt+=1



    --1.5x routine
    if lastBet.roll>66 then
        table.insert(rec66,1,"1")
    else table.insert(rec66,1,"0")
    end
    rec66cnt = ((add66(rec66)/#rec66))    
    if math.floor(33*mod/rec66cnt)>=100 then chance=66 bethigh=true end

 
 --2x routine
    if lastBet.roll>50 then
        table.insert(rec50,1,"1")
    else table.insert(rec50,1,"0")
    end
        rec50cnt = ((add50(rec50)/#rec50))
        if math.floor(50*mod/rec50cnt)>=100 then chance=50 bethigh=true end  
          --3x routine
       if lastBet.roll>33 then
           table.insert(rec33,1,"1")
       else table.insert(rec33,1,"0")
    end
    rec33cnt = ((add33(rec33)/#rec33))
    if math.floor(66*mod/rec33cnt)>=100 then chance=33 bethigh=true end

    
     --5x routine
       if lastBet.roll>25 then
           table.insert(rec25,+1,"1")
       else table.insert(rec25,+1,"0")
    end
       rec25cnt = ((add25(rec25)/#rec25))    
       if math.floor(75*mod/rec25cnt)>=100 then chance=25 bethigh=true end

   --10x routine
    if lastBet.roll>10 then
        table.insert(rec10,1,"1")
    else table.insert(rec10,1,"0")
    end
    rec10cnt = ((add10(rec10)/#rec10))    
    if math.floor(90*mod/rec10cnt)>=100 then chance=10 bethigh=true end
    
--bet armount routine


if win then a=0 nextbet=basebet  else
    a = a-currentprofit
payout  = (100-1)/chance
multi   = payout/(payout-1)
nextbet = a/(payout/multi)


end 
--Remove tables to keep sample size down
table.remove(rec10,90*mod2) 
table.remove(rec25,75*mod2)
table.remove(rec33,66*mod2)
table.remove(rec50,50*mod2) 
table.remove(rec66,33*mod2) 
         
if nextbet<basebet then nextbet=basebet end
--output
if initcnt>90*mod2 then 
    print("1.5x %"..math.floor(33*mod/rec66cnt))
print("2x %"..math.floor(50*mod/rec50cnt))
print("3x %"..math.floor(66*mod/rec33cnt))
print("4x %"..math.floor(75*mod/rec25cnt))
print("10x %"..math.floor(90*mod/rec10cnt))
print("-----------------")
--print("1.5x #"..#rec66)
--print("2x #"..#rec50)
--print("3x #"..#rec33)
--print("4x #"..#rec25)
--print("10x #"..#rec10)
end
--init and fixes 
if bets%10000==0 then resetseed() initcnt=0 end
if initcnt<90*mod2 then 
    print("░▒▓█ Initializing %"..math.floor(initcnt/(90*mod2)*100).." █▓▒░") 
    chance  = 55
    nextbet = prebet
    end
if (chance)==55 then nextbet=prebet end
nextbet = math.floor(nextbet*10^8)/10^8
if nextbet<=prebet then nextbet=prebet end
   if balance>=target then stop() ching() print("You win!") end
end

    
