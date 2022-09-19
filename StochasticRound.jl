# This code is for "stochastich rounding" mode
using Distributions
function StochasticRound(x)
    # extract the decimal portion
    r=trunc(x)
    q=abs(x-r)
    # draw a value 0 or 1 with probability
    # based on how close we already are
    Δx = wsample(0:1,[1-q,q],1)
     # make it negative if x is negative
     if(x<0)
         Δx=-Δx
     end
     # return our new value
     r+Δx[1]
end
