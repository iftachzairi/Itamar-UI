
clear all; 
close all;
clc;

Parameter = {"Last calibration Date","Next calibration Date","AGC",...
    "Integration Time","# of averages","# of smoothing","Centroid % of max",...
    "BIN1 : Min-Max","BIN2 : Min-Max","BIN3 : Min-Max","BIN4 : Min-Max",...
    "RED Hyst +/- x[nm]","IR Min Max","IR Hyst +/- x[nm]","Sample Size",...
    "% of out of range for FAIL BATCH", "Saturation Value", "Low signal value","Max Integration Time","BIN2+3 : Min-Max","JigSN","Software Version"};

Values = {"MM/YYYY",{[1,36]},"Yes/No",{[1,1000]},{[1,1000]},{[1,100]},{[20,95]}...
    ,{[600,700]},{[600,700]},{[600,700]},{[600,700]},{[0,2]},{[850,950]},{[0,2]},{[1,10000]},...
   {[1,100]},{[0.9,1]},{[0,0.1]},{[50,3000]},{[600,700]},1,1};

Default = {"None", 12, true,50,20,4,90,...
    {[657.4,658.8]},{[658.9,660.3]},{[660.4,661.8]},{[661.9,663.3]},...
    0.3, {[895,915]},0.8,50,20,0.98,0.3,1600,{[658.9,661.8]},'Jig1',1};

Changes = {"None", 12, true,50,20,4,90,...
    {[657.4,658.8]},{[658.9,660.3]},{[660.4,661.8]},{[661.9,663.3]},...
    0.3, {[895,915]},0.8,50,20,0.98,0.3,1600,{[658.9,661.8]},'Jig1',1};

Remarks = {"No default", "Months from last","Integration Time Based","mSec","",""...
    ,"For peak calculation, centroid based","For Pass Fail (added 0.3[nm] to EpiGap)",...
    "For Pass Fail (added 0.3[nm] to EpiGap)","For Pass Fail (added 0.3[nm] to EpiGap)","For Pass Fail (added 0.3[nm] to EpiGap)",...
    "For Pass Fail & statistics","For Pass Fail","For Pass Fail & statistics","Closes report file once done, manual overrule",...
    "","Normalized by max value","Normalized by max value","","","",""};

T.Changes = Changes;
T.Default = Default;
T.Values = Values;
T.Remarks = Remarks;
T.Parameter = Parameter;

save('Params.mat','T');
