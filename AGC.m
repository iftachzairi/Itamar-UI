function [intTime,isgood] = AGC(mag,currIntT)
%AGC supplies new integration time if the current magnitude is not good
%   Detailed explanation goes here
global T
Min = T.Changes{18};
Max = T.Changes{17};
if mag>=Min&&mag<=Max
    intTime = currIntT;
    isgood = true;
    return
elseif mag>Max
    intTime = 20;%mSec
else
    intTime = currIntT*2;
end
isgood=false;
end

