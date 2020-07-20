function varargout = Settings(varargin)
% SETTINGS MATLAB code for Settings.fig
%      SETTINGS, by itself, creates a new SETTINGS or raises the existing
%      singleton*.
%
%      H = SETTINGS returns the handle to a new SETTINGS or the handle to
%      the existing singleton*.
%
%      SETTINGS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SETTINGS.M with the given input arguments.
%
%      SETTINGS('Property','Value',...) creates a new SETTINGS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Settings_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Settings_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Settings

% Last Modified by GUIDE v2.5 20-Jul-2020 15:07:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Settings_OpeningFcn, ...
                   'gui_OutputFcn',  @Settings_OutputFcn, ...
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


% --- Executes just before Settings is made visible.
function Settings_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Settings (see VARARGIN)

% Choose default command line output for Settings
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Settings wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Settings_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function Bin1MinEdit_Callback(hObject, eventdata, handles)
% hObject    handle to Bin1MinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{8}{1}(1) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Bin1MinEdit as text
%        str2double(get(hObject,'String')) returns contents of Bin1MinEdit as a double


% --- Executes during object creation, after setting all properties.
function Bin1MinEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin1MinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{8}{1}(1));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IRHystEdit_Callback(hObject, eventdata, handles)
% hObject    handle to IRHystEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{14} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of IRHystEdit as text
%        str2double(get(hObject,'String')) returns contents of IRHystEdit as a double


% --- Executes during object creation, after setting all properties.
function IRHystEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IRHystEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.2f',T.Changes{14});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin2MinEdit_Callback(hObject, eventdata, handles)
% hObject    handle to Bin2MinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{9}{1}(1) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Bin2MinEdit as text
%        str2double(get(hObject,'String')) returns contents of Bin2MinEdit as a double


% --- Executes during object creation, after setting all properties.
function Bin2MinEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin2MinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{9}{1}(1));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin3MinEdit_Callback(hObject, eventdata, handles)
% hObject    handle to Bin3MinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{10}{1}(1) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Bin3MinEdit as text
%        str2double(get(hObject,'String')) returns contents of Bin3MinEdit as a double


% --- Executes during object creation, after setting all properties.
function Bin3MinEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin3MinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{10}{1}(1));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin2MaxEdit_Callback(hObject, eventdata, handles)
% hObject    handle to Bin2MaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{9}{1}(2) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Bin2MaxEdit as text
%        str2double(get(hObject,'String')) returns contents of Bin2MaxEdit as a double


% --- Executes during object creation, after setting all properties.
function Bin2MaxEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin2MaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{9}{1}(2));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin3MaxEdit_Callback(hObject, eventdata, handles)
% hObject    handle to Bin3MaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{10}{1}(2) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Bin3MaxEdit as text
%        str2double(get(hObject,'String')) returns contents of Bin3MaxEdit as a double


% --- Executes during object creation, after setting all properties.
function Bin3MaxEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin3MaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{10}{1}(2));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin4MaxEdit_Callback(hObject, eventdata, handles)
% hObject    handle to Bin4MaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{11}{1}(2) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Bin4MaxEdit as text
%        str2double(get(hObject,'String')) returns contents of Bin4MaxEdit as a double


% --- Executes during object creation, after setting all properties.
function Bin4MaxEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin4MaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{11}{1}(2));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Bin4MinEdit_Callback(hObject, eventdata, handles)
% hObject    handle to Bin4MinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{11}{1}(1) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Bin4MinEdit as text
%        str2double(get(hObject,'String')) returns contents of Bin4MinEdit as a double


% --- Executes during object creation, after setting all properties.
function Bin4MinEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin4MinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{11}{1}(1));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function REDHystEdit_Callback(hObject, eventdata, handles)
% hObject    handle to REDHystEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{12} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of REDHystEdit as text
%        str2double(get(hObject,'String')) returns contents of REDHystEdit as a double


% --- Executes during object creation, after setting all properties.
function REDHystEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to REDHystEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.2f',T.Changes{12});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function LSValEdit_Callback(hObject, eventdata, handles)
% hObject    handle to LSValEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{18} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of LSValEdit as text
%        str2double(get(hObject,'String')) returns contents of LSValEdit as a double


% --- Executes during object creation, after setting all properties.
function LSValEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LSValEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.2f',T.Changes{18});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SatValEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SatVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{17} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of SatVal as text
%        str2double(get(hObject,'String')) returns contents of SatVal as a double


% --- Executes during object creation, after setting all properties.
function SatValEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SatValEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.2f',T.Changes{17});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SampleEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SampleEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{15} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of SampleEdit as text
%        str2double(get(hObject,'String')) returns contents of SampleEdit as a double


% --- Executes during object creation, after setting all properties.
function SampleEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SampleEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.0f',T.Changes{15});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CentroidEdit_Callback(hObject, eventdata, handles)
% hObject    handle to CentroidEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{7} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of CentroidEdit as text
%        str2double(get(hObject,'String')) returns contents of CentroidEdit as a double


% --- Executes during object creation, after setting all properties.
function CentroidEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CentroidEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.0f',T.Changes{7});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SmoothingEdit_Callback(hObject, eventdata, handles)
% hObject    handle to SmoothingEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{6} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of SmoothingEdit as text
%        str2double(get(hObject,'String')) returns contents of SmoothingEdit as a double


% --- Executes during object creation, after setting all properties.
function SmoothingEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SmoothingEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.0f',T.Changes{6});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IntTimeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to IntTimeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{4} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of IntTimeEdit as text
%        str2double(get(hObject,'String')) returns contents of IntTimeEdit as a double


% --- Executes during object creation, after setting all properties.
function IntTimeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IntTimeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%5.0f',T.Changes{4});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IRMaxEdit_Callback(hObject, eventdata, handles)
% hObject    handle to IRMaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{13}{1}(2) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of IRMaxEdit as text
%        str2double(get(hObject,'String')) returns contents of IRMaxEdit as a double


% --- Executes during object creation, after setting all properties.
function IRMaxEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IRMaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{13}{1}(2));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IRMinEdit_Callback(hObject, eventdata, handles)
% hObject    handle to IRMinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{13}{1}(1) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of IRMinEdit as text
%        str2double(get(hObject,'String')) returns contents of IRMinEdit as a double


% --- Executes during object creation, after setting all properties.
function IRMinEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IRMinEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{13}{1}(1));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AveEdit_Callback(hObject, eventdata, handles)
% hObject    handle to AveEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{5} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of AveEdit as text
%        str2double(get(hObject,'String')) returns contents of AveEdit as a double


% --- Executes during object creation, after setting all properties.
function AveEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AveEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.0f',T.Changes{5});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MaxIntTimeEdit_Callback(hObject, eventdata, handles)
% hObject    handle to MaxIntTimeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{19} = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of MaxIntTimeEdit as text
%        str2double(get(hObject,'String')) returns contents of MaxIntTimeEdit as a double


% --- Executes during object creation, after setting all properties.
function MaxIntTimeEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxIntTimeEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%4.0f',T.Changes{19});
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Restore.
function Restore_Callback(hObject, eventdata, handles)
% hObject    handle to Restore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes = T.Default;
close(Settings);
Settings();


% --- Executes on button press in Done.
function Done_Callback(hObject, eventdata, handles)
% hObject    handle to Done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pressedDown
pressedDown = true;
close(Settings);



function Bin1MaxEdit_Callback(hObject, eventdata, handles)
% hObject    handle to Bin1MaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global T
T.Changes{8}{1}(2) = str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of Bin1MaxEdit as text
%        str2double(get(hObject,'String')) returns contents of Bin1MaxEdit as a double


% --- Executes during object creation, after setting all properties.
function Bin1MaxEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Bin1MaxEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global T
myString = sprintf('%3.1f',T.Changes{8}{1}(2));
set(hObject, 'String', myString);
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pressedDown
if pressedDown
    global T
    save('Params.mat','T'); 
end
    delete(hObject); 
% Hint: delete(hObject) closes the figure
