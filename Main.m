function varargout = Main(varargin)
% MAIN MATLAB code for Main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Main

% Last Modified by GUIDE v2.5 08-Jul-2020 10:56:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Main_OpeningFcn, ...
                   'gui_OutputFcn',  @Main_OutputFcn, ...
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


% --- Executes just before Main is made visible.
function Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Main (see VARARGIN)

% Choose default command line output for Main
handles.output = hObject;
global numFromSample
numFromSample = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%connectivity check
global P
P=spectrometer('getparameter');
ver=spectrometer('getversion');
nPix=spectrometer('getnumpixels') ;
if P.SensorType
    %msgbox(sprintf('Friendly name: %s\nSensortype: %d\nNumber of pixels: %d\nDll version: %s',P.FriendlyName,P.SensorType,nPix,ver.dll), 'Spectrometer Info')
else
        conMs = msgbox('Error: No Spectrometer Detected!','Error','error');
        conth = findall(conMs, 'Type', 'Text'); 
        conth.FontSize = 14;
        set(conMs, 'position', [100 150 300 100]); %makes box bigger
        return
end
    


%message
CreateStruct.WindowStyle = 'modal';
CreateStruct.Interpreter = 'tex';
waitMs = msgbox('\fontsize{15} Measuring...','Please Wait','help',CreateStruct);



%init
global numFromSample
global stoploop
global S %measurement specifications
global T %params Table
global Measnum
Measnum = 1;
nPix=spectrometer('getnumpixels');
spectrometer('usehighres',true);
stoploop=false;
NrMeas=0;
S.StartPixel=0;
S.StopPixel=nPix-1;
S.IntegrationDelay=0;
S.CorDynDark=1;%changed
S.Smoothing=T.Changes{6};%changed
S.TriggerMode=0;
S.TriggerSource=0;
S.TriggerSourceType=0;
S.SaturationDetection=1;
S.IntegrationTime = T.Changes{4};
S.NrAverages = T.Changes{5};

%find Peak
for LED = ["RED","IR"]
    isgood=false;
    while NrMeas<10&&~isgood
        myLambda=spectrometer('getlambda');
        spectrometer('measconfig',S);
        spectrometer('measure',1);
        myData=spectrometer('getdata');
        myData = (myData-min(myData))/6.4993e+04;%normalized magnitude in relation to saturation
        mySat=spectrometer('getsaturated');
        switch LED %cut relevant part
            case "RED"
                myData = myData(17:1083);
                mySat = mySat(17:1083);   
                myLambda = myLambda(17:1083);
            case "IR"
                myData = myData(1155:3768);
                mySat = mySat(1155:3768);
                myLambda = myLambda(1155:3768);
        end       
        
        %stop if saturated at minimal time
        if sum(mySat)&&S.IntegrationTime==20
            break;
        end
        [freq,mag,bin] = fwFrequency(myLambda,myData,LED);
        [S.IntegrationTime,isgood] = AGC(mag,S.IntegrationTime);
        NrMeas=NrMeas+1;
        pause(0.001)  %seconds !!
        

        %stop if too long to converge
        if S.IntegrationTime >=T.Changes{19}%mSec
            break;
        end
    end
            NrMeas = 0;
    
        %collect Data
        switch LED
            case "RED"
                Data.RED.mySat = sum(mySat);
                Data.RED.isgood = isgood;
                Data.RED.mag = mag;
                Data.RED.freq = freq;
                Data.RED.bin = bin;
                Data.RED.Int = S.IntegrationTime;
            case "IR"
                Data.IR.mySat = sum(mySat);
                Data.IR.isgood = isgood;
                Data.IR.mag = mag;
                Data.IR.freq = freq;
                Data.IR.bin = bin;
                Data.IR.Int = S.IntegrationTime;
        end
end
[numFromSample,Verdict] = SaveData(Data,numFromSample);
close(waitMs);
if Verdict == 1||Verdict == 2||Verdict == 3    
%message
    freqMs = msgbox(sprintf('Done!'),'Done','help');
    th = findall(freqMs, 'Type', 'Text');
    th.FontSize = 14;
    set(freqMs,'Position',[350 499 150 70])
    pause(1);
    delete(freqMs);
end
verdictPlotter(Verdict,Data,handles);



% --- Executes on button press in End.
function End_Callback(hObject, eventdata, handles)
% hObject    handle to End (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if exist('waitMs')
    close(waitMs);
end
exitSafe();



% --- Executes on button press in TestMode.
function TestMode_Callback(hObject, eventdata, handles)
% hObject    handle to TestMode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
test();


% --- Executes during object creation, after setting all properties.
function testerTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to testerTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Intro
if ~isempty(Intro.TesterName)
    myString = sprintf('%s',Intro.TesterName);
else
    myString = sprintf('Undefined');
end
set(hObject, 'String', myString);


% --- Executes during object creation, after setting all properties.
function lotTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lotTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Intro
if ~isempty(Intro.lotNumber)
    myString = sprintf('%s',Intro.lotNumber);
else
    myString = sprintf('Undefined');
end
set(hObject, 'String', myString);


% --- Executes during object creation, after setting all properties.
function binTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to binTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Intro
if ~isempty(Intro.bin)
    if Intro.bin == "13"
        myString = sprintf('2+3');
    else
        myString = sprintf('%s',Intro.bin);
    end
else
    myString = sprintf('Undefined');
end
set(hObject, 'String', myString);


% --- Executes during object creation, after setting all properties.
function sampTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('0/%d',T.Changes{15});
set(hObject, 'String', myString);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if exist('waitMs')
    close(waitMs);
end
exitSafe();
% Hint: delete(hObject) closes the figure
% delete(hObject);
