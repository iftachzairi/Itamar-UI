function varargout = test(varargin)
% TEST M-file for test.fig
%      TEST, by itself, creates a new TEST or raises the existing
%      singleton*.
%
%      H = TEST returns the handle to a new TEST or the handle to
%      the existing singleton*.
%
%      TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST.M with the given input arguments.
%
%      TEST('Property','Value',...) creates a new TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test

% Last Modified by GUIDE v2.5 25-Jun-2020 15:37:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test (see VARARGIN)

% Choose default command line output for test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

xlabel('Wavelength [nm]')
ylabel('Counts')

% UIWAIT makes test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Info.
function Info_Callback(hObject, eventdata, handles)
% hObject    handle to Info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global P
clear('P');
P=spectrometer('getparameter');
ver=spectrometer('getversion');
nPix=spectrometer('getnumpixels') ;
msgbox(sprintf('Friendly name: %s\nSensortype: %d\nNumber of pixels: %d\nDll version: %s',P.FriendlyName,P.SensorType,nPix,ver.dll), 'Spectrometer Info')

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)

function MeasnumEdt_Callback(hObject, eventdata, handles)
% hObject    handle to MeasnumEdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MeasnumEdt as text
%        str2double(get(hObject,'String')) returns contents of MeasnumEdt as a double
global MeasnumTest
MeasnumTest=str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function MeasnumEdt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MeasnumEdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'String','1');
global MeasnumTest
MeasnumTest=1;

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in AnalogInDemo.
function AnalogInDemo_Callback(hObject, eventdata, handles)
% hObject    handle to AnalogInDemo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
analog=spectrometer('getanalogin',3);
msgbox(sprintf('Analog Input #3 (USB voltage): %5.3f V',analog))

% --- Executes on button press in StartMeas.
function StartMeas_Callback(hObject, eventdata, handles)
% hObject    handle to StartMeas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stoploopTest
global ST
global MeasnumTest
MeasnumTest = 1;
nPix=spectrometer('getnumpixels') ;
spectrometer('usehighres',true);
stoploop=false;
NrMeas=0;

while (stoploop==false) & (NrMeas<MeasnumTest)
    ST.StartPixel=0;
    ST.StopPixel=nPix-1;
    ST.IntegrationDelay=0;
    ST.CorDynDark=1;%changed
    %S.Smoothing=4;%changed
    ST.TriggerMode=0;
    ST.TriggerSource=0;
    ST.TriggerSourceType=0;
    ST.SaturationDetection=1;
    myLambda=spectrometer('getlambda');
    spectrometer('measconfig',ST);
    spectrometer('measure',1);
    myData=spectrometer('getdata');
    mySat=spectrometer('getsaturated');
    plot(myLambda,myData);
    NrMeas=NrMeas+1;
    xlabel('Wavelength [nm]');
    ylabel('Counts');
    pause(0.001)  %seconds !!
end
freqMs = msgbox(sprintf('Done!'),'123','help');
th = findall(freqMs, 'Type', 'Text'); 
th.FontSize = 14;  



% --- Executes on button press in StopMeas.
function StopMeas_Callback(hObject, eventdata, handles)
% hObject    handle to StopMeas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global stoploopTest
stoploopTest=true;

function AverageEdt_Callback(hObject, eventdata, handles)
% hObject    handle to AverageEdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AverageEdt as text
%        str2double(get(hObject,'String')) returns contents of AverageEdt as a double
global ST
ST.NrAverages=str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function AverageEdt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AverageEdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global ST
set(hObject,'String','20');
ST.NrAverages=20;

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function IntTimeEdt_Callback(hObject, eventdata, handles)
% hObject    handle to IntTimeEdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IntTimeEdt as text
%        str2double(get(hObject,'String')) returns contents of IntTimeEdt as a double
global ST
inttimestring=strrep(get(hObject,'String'),',','.');  %replace all decimal commas with points
set(hObject,'String',inttimestring)
ST.IntegrationTime=str2double(inttimestring);

% --- Executes during object creation, after setting all properties.
function IntTimeEdt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IntTimeEdt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global ST
set(hObject,'String','50.0');
ST.IntegrationTime=50.0;

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SimpleMax.
function SimpleMax_Callback(hObject, eventdata, handles)
% hObject    handle to SimpleMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ST;

%detection of saturation
% mySat=spectrometer('getsaturated');
% if sum(mySat)
%     satMs = msgbox(sprintf('Saturation Detected!'),'Error','error');
%     satth = findall(satMs, 'Type', 'Text'); 
%     satth.FontSize = 14;  
%     return
% end

%taking data from the plot
h = findobj(gca,'Type','line');
xA=get(h,'Xdata');
yA=get(h,'Ydata');

for LED = ["RED","IR"]

    switch LED
        case "RED"
            x=xA(17:1083);
            y=yA(17:1083);
                
            %calculating and plotting both maxes
            %[m,i]=max(y);
            [iF,mF,bin] = fwFrequency(x,y,LED);
            hold on
            %scatter(x(i),m,'r','filled');
            scatter(iF,mF,'k','filled');
        case "IR"        
            x2=xA(1155:3768);
            y2=yA(1155:3768); 
            %calculating and plotting both maxes
            %[m2,i2]=max(y2);
            [iF2,mF2,bin2] = fwFrequency(x2,y2,LED);
            hold on
            %scatter(x2(i),m2+1155,'r','filled');
            scatter(iF2,mF2,'k','filled');
    end
end
hold off
%message box
%RED
freqMs = msgbox(sprintf('Max Frequency\nFW90M: %5.1f\nBin:%s\n', iF,bin)...
       ,'Measurements');

th = findall(freqMs, 'Type', 'Text'); 
th.FontSize = 14;  

deltaWidth = sum(th.Extent([1,3]))-freqMs.Position(3) + th.Extent(1);
deltaHeight = sum(th.Extent([2,4]))-freqMs.Position(4) + 10;
freqMs.Position([3,4]) = freqMs.Position([3,4]) + [deltaWidth, deltaHeight];

%IR
freqMsIR = msgbox(sprintf('Max Frequency\n FW90M: %5.1f\nBin:%s\n',iF2,bin2)...
       ,'Measurements');

th = findall(freqMsIR, 'Type', 'Text'); 
th.FontSize = 14;  

deltaWidth = sum(th.Extent([1,3]))-freqMsIR.Position(3) + th.Extent(1);
deltaHeight = sum(th.Extent([2,4]))-freqMsIR.Position(4) + 10;
freqMsIR.Position([3,4]) = freqMsIR.Position([3,4]) + [deltaWidth, deltaHeight];












% --- Executes on button press in Smoothing.
function Smoothing_Callback(hObject, eventdata, handles)
% hObject    handle to Smoothing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ST
ST.Smoothing=str2num(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Smoothing as text
%        str2double(get(hObject,'String')) returns contents of Smoothing as a double


% --- Executes during object creation, after setting all properties.
function Smoothing_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Smoothing (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global ST
set(hObject,'String','4');
ST.Smoothing=4;
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
