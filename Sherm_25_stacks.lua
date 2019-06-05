--This script is for dicebot. It gives up on martingale after 4 rolls at 25% chance.
--It tracks failed rounds and successive losses and makes it up.
--If you make money, consider donating to 13ULwMZkSmtYwc9J8dJTf2PKeJhrneEaMh
 
 
 
 
    chance=25
    prebet=0.00000001
    base = 0.00000001
    betcount=0
    bethigh=true
    multiplier=1.25
    losscount=1
    strike = false
    resetseed()
minlosscount=1
nextbet=prebet
profit=0 
    function dobet()
--if lastBet.roll<50 then bethigh=true else bethigh=false end
        if (betcount < 4) then
            print(betcount)
            betcount += 1
            nextbet = base
                if (win) then
                   losscount = losscount-1 
                   print("losscountminlosss ".. losscount)
                    betcount = 0
if losscount<1 then losscount=1 end
                    nextbet = base  * (2 ^ losscount)
                print("naminloss ".. losscount)
                else
                    nextbet = previousbet * multiplier
                    strike = true                              
                end
 
        else
                if (strike == true) then                       
                    losscount = losscount + 1
                    strike = false                            
                end                                            
      losscount = losscount + 0.1
                print("losscount100 : ".. losscount)
 
                if (betcount >= 4) then
                    nextbet = prebet
                print("losscount>100 : ".. losscount)
 profit=profit+currentprofit
print(profit)
                    if (win) then
	      profit=0
                      betcount =  0
                     print("losscountifwin : ".. losscount)
                  nextbet = base  * (2 ^ losscount)
--nextbet = base* losscount--
                      strike = false                            ----- NEW
                    end                                                
                end
        end
    end
