function [] = writeReport(toFile)
global T
global Intro
now = clock();

fileName = ['BinningReport' num2str(now(3)) '-' num2str(now(2)) '-' num2str(now(1)) '_' num2str(now(4)) '_' num2str(now(5)) '_' num2str(floor(now(6))) '.xlsx'];
%% Variables 
currDate = date;
testerName = Intro.TesterName;
selectedBin = Intro.bin;
lotNum = Intro.lotNumber;
jigSN = T.Changes{21};
softwareVer = T.Changes{22};
sampleSize = T.Changes{15};
%[month,year,day] = str.split(Intro.specCalib,'\');
%specCalib = datetime(year,month,day);
%nextSpecCalib




%% Variables calculations(pass/fail)

passGRed = sum(cell2mat(toFile(2:end,5)) == 1);
passYRed = sum(cell2mat(toFile(2:end,5)) == 2);
failRed = sum(cell2mat(toFile(2:end,5)) == 3);

passGIR = sum(cell2mat(toFile(2:end,10)) == 1);
passYIR = sum(cell2mat(toFile(2:end,10)) == 2);
failIR = sum(cell2mat(toFile(2:end,10)) == 3);

% if more than % of population in yellow than fail

failCriteria = T.Changes{16};


percentOfMismatchRED = (passYRed/sampleSize)*100;
percentOfMismatchIR = (passYIR/sampleSize)*100;
if percentOfMismatchRED>= failCriteria||failRed
    batchVerdictRED='Fail';
else
    batchVerdictRED='Pass';
end

if percentOfMismatchIR>= failCriteria||failIR
    batchVerdictIR='Fail';
else
    batchVerdictIR='Pass';
end
%% write to excel
copyfile('ReportTemplateBinning.xlsx',fileName);
xlswrite(fileName, toFile, 'Raw');

xlswrite(fileName, {jigSN}, 'Report','B1');
xlswrite(fileName, {softwareVer}, 'Report','B2');
xlswrite(fileName, {testerName}, 'Report','B5');

if selectedBin == "13"
    selectedBin = "2+3";
end
xlswrite(fileName, {convertStringsToChars(selectedBin)}, 'Report','B8');

xlswrite(fileName, {num2str(passGRed);num2str(passYRed);num2str(failRed)}, 'Report','B13:B15');
xlswrite(fileName, {batchVerdictRED}, 'Report','B17');

xlswrite(fileName, {num2str(passGIR);num2str(passYIR);num2str(failIR)}, 'Report','B21:B23');
xlswrite(fileName, {batchVerdictIR}, 'Report','B25');

xlswrite(fileName, {currDate}, 'Report','F5');
xlswrite(fileName, {sampleSize}, 'Report','B9');

if strcmp(batchVerdictIR,'Pass') && strcmp(batchVerdictRED,'Pass')
    xlswrite(fileName, {'Pass'}, 'Report','E11');
else
    xlswrite(fileName, {'Fail'}, 'Report','E11');
end

xlswrite(fileName, {num2str(percentOfMismatchRED)}, 'Report','B16');
xlswrite(fileName, {num2str(percentOfMismatchIR)}, 'Report','B24');

end