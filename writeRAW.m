function [] = writeRAW()
%writeRAW writes "Raw" data to csv File

global RAW
numOfSamp = length(RAW);
toFile = {'WaveLength_RED','Bin_RED',...
    'Final_Integration_Time_RED','Final_Magnitude_RED','Verdict_RED','WaveLength_IR','Bin_IR','Final_Integration_Time_IR','Final_Magnitude_IR','Verdict_IR'};


for i = 2:numOfSamp+1
    toFile(i,1:10) = {RAW{i-1}.RED.freq,convertStringsToChars(RAW{i-1}.RED.bin),RAW{i-1}.RED.Int,RAW{i-1}.RED.mag,RAW{i-1}.RED.verdict,...
        RAW{i-1}.IR.freq,convertStringsToChars(RAW{i-1}.IR.bin),RAW{i-1}.IR.Int,RAW{i-1}.IR.mag,RAW{i-1}.IR.verdict};
end


% Convert cell to a table and use first row as variable names
%TA = cell2table(toFile(2:end,:),'VariableNames',toFile(1,:));
 
% Write the table to a CSV file
%writetable(TA,FileName);
writeReport(toFile);

end

