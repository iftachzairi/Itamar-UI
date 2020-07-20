function verdictPlotter(ver,Data,handles)
%verdictPlotter fills fields in UI with data
global numFromSample
global T
switch ver
    case 4
        myString = sprintf('Error');
        set(handles.PFTxt, 'String', myString);
        set(handles.PFTxt,'ForegroundColor','red')
        return
    case 1 
        myString = sprintf('Pass');
        set(handles.PFTxt, 'String', myString);
        set(handles.PFTxt,'ForegroundColor','green')
    case 2
        myString = sprintf('Pass');
        set(handles.PFTxt, 'String', myString);
        set(handles.PFTxt,'ForegroundColor','yellow')
    case 3
        myString = sprintf('Fail');
        set(handles.PFTxt, 'String', myString);
        set(handles.PFTxt,'ForegroundColor','red')
end
        myString = sprintf('%s',Data.RED.bin);
        set(handles.newBinTxt, 'String', myString);
        
        myString = sprintf('%3.1f',Data.RED.freq);
        set(handles.newRedTxt, 'String', myString);
        
        myString = sprintf('%3.1f',Data.IR.freq);
        set(handles.newIRTxt, 'String', myString);
        
        myString = sprintf('%d/%d',numFromSample,T.Changes{15});
        set(handles.sampTxt, 'String', myString);
        
end

