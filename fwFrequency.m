function [fwFreq,fwMag,bin] = fwFrequency(freq,mag,LED)
%fwFrequency calculates the maximum exposure frequency and magnitude and provides bin data
%% init
global T
percent = T.Changes{7};
Bin1 = T.Changes{8}{1};
Bin2 = T.Changes{9}{1};
Bin3 = T.Changes{10}{1};
Bin4 = T.Changes{11}{1};
IRRange = T.Changes{13}{1};
% %% cut the relevant LED
% switch LED
%     case "RED"
%         mag = mag(17:1083);
%         freq = freq(17:1083);
%     case "IR"
%         mag = mag(1155:3768);
%         freq = freq(1155:3768);
% end


%% use Full Width percent Max to find maximum exposure
%Find the 90% max value.
halfMax = (max(mag) - min(mag))*(percent/100);
% Find where the data last rises above percent% of max.
index1 = find(mag >= halfMax, 1, 'first');  
% Find where the data first drops below percent% of max.
index2 = find(mag >= halfMax, 1, 'last');
fwhm = floor((index2+index1)/2); % FWHM in indexes.
fwFreq = freq(fwhm);%output in frequency
fwMag = mag(fwhm);%output in magnitude
    
%% Find bin assignment
iF = round(fwFreq*10)/10;


switch LED
    case "RED"
    switch iF
        case ((iF>=Bin1(1))&&iF<=Bin1(2))*iF
            bin = "1";
        case (iF>=Bin2(1)&&iF<=Bin2(2))*iF
            bin = "2";
        case (iF>=Bin3(1)&&iF<=Bin3(2))*iF
            bin = "3";
        case (iF>=Bin4(1)&&iF<=Bin4(2))*iF
            bin = "4";

        otherwise
            bin = "None";
    end
    case "IR"
        if (iF>=IRRange(1)&&iF<=IRRange(2))
            bin = "IR";
        else
            bin = "None";
        end
        
end
end
