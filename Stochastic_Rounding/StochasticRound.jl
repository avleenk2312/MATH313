# This code is for "stochastich rounding" mode
#Reference: Code in R: https://gist.github.com/coleoguy/a50dba496fc55440cb4945fe8e25d703 
#          as mentioned in https://medium.com/@minghz42/what-is-stochastic-rounding-b78670d0c4a


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
