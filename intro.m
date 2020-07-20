function varargout = intro(varargin)
% INTRO MATLAB code for intro.fig
%      INTRO, by itself, creates a new INTRO or raises the existing
%      singleton*.
%
%      H = INTRO returns the handle to a new INTRO or the handle to
%      the existing singleton*.
%
%      INTRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTRO.M with the given input arguments.
%
%      INTRO('Property','Value',...) creates a new INTRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before intro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to intro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help intro

% Last Modified by GUIDE v2.5 08-Jul-2020 21:49:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @intro_OpeningFcn, ...
                   'gui_OutputFcn',  @intro_OutputFcn, ...
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


% --- Executes just before intro is made visible.
function intro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to intro (see VARARGIN)
global Intro
Intro.bin = "1";
global T %parameters
load('Params.mat');
% Choose default command line output for intro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes intro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = intro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function LotNumber_Callback(hObject, eventdata, handles)
% hObject    handle to LotNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
Intro.lotNumber = get(hObject,'String');
% Hints: get(hObject,'String') returns contents of LotNumber as text
%        str2double(get(hObject,'String')) returns contents of LotNumber as a double


% --- Executes during object creation, after setting all properties.
function LotNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LotNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function specCalib_Callback(hObject, eventdata, handles)
% hObject    handle to specCalib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
Intro.specCalib = get(hObject,'String');
% Hints: get(hObject,'String') returns contents of specCalib as text
%        str2double(get(hObject,'String')) returns contents of specCalib as a double


% --- Executes during object creation, after setting all properties.
function specCalib_CreateFcn(hObject, eventdata, handles)
% hObject    handle to specCalib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Intro
Intro.specCalib = set(hObject,'String','');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TesterName_Callback(hObject, eventdata, handles)
% hObject    handle to TesterName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
Intro.TesterName = get(hObject,'String');
% Hints: get(hObject,'String') returns contents of TesterName as text
%        str2double(get(hObject,'String')) returns contents of TesterName as a double


% --- Executes during object creation, after setting all properties.
function TesterName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TesterName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global Intro
Intro.TesterName = set(hObject,'String','');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Done.
function Done_Callback(hObject, eventdata, handles)
% hObject    handle to Done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
if ~length(Intro.specCalib)||~length(Intro.lotNumber)
   set(handles.mendatoryError,'visible','on');
else
    Main(Intro);
    close('intro');
end


% --- Executes on button press in Settings.
function Settings_Callback(hObject, eventdata, handles)
% hObject    handle to Settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T

correctflag = false;
while ~correctflag
    password = pass.passwordUI('Query','NumOnly',3);
    if strcmp(password,'123')
        correctflag = true;
    else
        passMs = msgbox('Wrong Password, Please Try Again:','Press OK','warn');
        waitfor(passMs);
    end 
end
 Settings(T);






% --------------------------------------------------------------------
function uibuttongroup1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
Intro.bin = "1";
% Hint: get(hObject,'Value') returns toggle state of radiobutton1

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
Intro.bin = "2";
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
Intro.bin = "3";
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
Intro.bin = "4";
% Hint: get(hObject,'Value') returns toggle state of radiobutton4

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Intro
Intro.bin = "13";
% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
