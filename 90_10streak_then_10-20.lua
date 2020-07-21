chance   = 90
base     = 0.00000001  
nextbet  = base
enablezz = false --set to true to use high/low switching 
--settings from advanced mode

enablesrc=false --set to true to use stop/reset conditions 
--settings from advanced mode
payout = 0
multi  = 0
prof   = 0
a      = 1
function dobet()
if (a)==1 and win then
     prof    = 0
     a       = 0
     chance  = 90
     nextbet = base
 end
 if !win then
    prof = prof-currentprofit
end

if (currentstreak)==10
       then
       chance = math.random(100,200)/10
 bethigh = !bethigh

end
    
if chance<90 then

        chance = math.random(100,300)/10
        payout = (100-1)/chance
    multi   = payout/(payout-1)
    nextbet = prof/(payout/multi)
    a       = 1
end
if bets%10000==0 then resetseed() end

    if nextbet<base then nextbet=base end

        nextbet = math.floor(nextbet*10^8)/10^8
    end
  
