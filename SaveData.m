function [numSamp,finalVerdict] = SaveData(Data,numFromSample)
%SAVEDATA organizes all the data from every measurement in a global
%variable RAW
%codes for error later
% 1 = GPass, 2 = YPass,3=Fail,4 = LSRED, 5 = LSIR, 6 = SATRED, 7 = SATIR;
%final verdict
%1 = GPass, 2 = YPass,3=Fail, 4=Error

global Intro
global RAW
global T

%% decide IR verdict
if Data.IR.isgood%good meas
    if Data.IR.bin == "IR"%good meas and correct bin
        verdictIR = 1;
    %close to correct bin
    elseif Data.IR.freq<=T.Changes{13}{1}(1)-T.Changes{14}&&Data.IR.freq>=T.Changes{13}{1}(2)+T.Changes{14}
        verdictIR = 3;
    else
        verdictIR = 2;
    end
else%bad meas
    %bad meas sat
    if Data.IR.mySat
        verdictIR = 7;
    %bad meas low signal
    else
        verdictIR = 5;
    end
end

%% decide RED verdict
binNum = str2double(Data.RED.bin);
introBinNum = str2double(Intro.bin);
%test case
%Data.RED.freq = 658.1;
if Data.RED.isgood %good meas
    if Data.RED.bin == Intro.bin %good meas and correct bin
        verdictRED = 1;
    elseif Intro.bin == "13"&& (Data.RED.bin == "2"|| Data.RED.bin == "3")
        verdictRED = 1;
    elseif Data.RED.freq<T.Changes{7+introBinNum}{1}(1)-T.Changes{12}||Data.RED.freq>T.Changes{7+introBinNum}{1}(2)+T.Changes{12}
        verdictRED = 3;%out of bin
    else %good meas close to bin
        verdictRED = 2;
    end
    
else %bad meas
    if Data.RED.mySat
        verdictRED = 6;
    %bad meas low signal
    else
        verdictRED = 4;
    end
end
Data.RED.verdict = verdictRED;    
%% verdict decider

switch verdictIR
    case 7
        satMs = msgbox(sprintf('Error: Saturation Detected!(IR)'),'Error','error');
        satth = findall(satMs, 'Type', 'Text'); 
        satth.FontSize = 14;
        verdictFIR = 4;
    case 5
        satMs = msgbox(sprintf('Error: Low Signal!(IR)'),'Error','error');
        satth = findall(satMs, 'Type', 'Text'); 
        satth.FontSize = 14;
        verdictFIR = 4;
    otherwise
        verdictFIR = verdictIR;
end

switch verdictRED
    case 6
        satMs = msgbox(sprintf('Error: Saturation Detected!(RED)'),'Error','error');
        satth = findall(satMs, 'Type', 'Text'); 
        satth.FontSize = 14;
        verdictFRED = 4;
    case 4
        satMs = msgbox(sprintf('Error: Low Signal!(RED)'),'Error','error');
        satth = findall(satMs, 'Type', 'Text'); 
        satth.FontSize = 14;
        verdictFRED = 4;
    otherwise
        verdictFRED = verdictRED;
end
Data.IR.verdict = verdictIR;   
finalVerdict = max(verdictFRED,verdictFIR);%increasing severity

%% update num of samp only if the meas is good
if finalVerdict == 1||finalVerdict == 2||finalVerdict == 3
    numSamp = numFromSample+1;
    RAW{numSamp} = Data;
else
    numSamp = numFromSample;
end
        
end

