%% In His Exalted Name
% Psychophysic Workshope 2021  (Held in: Psychology & education school
% University of Tehran)
%
%
%written by : Amir.M Mousavi.H
%
%
%amir.harris@sru.ac.ir
%
%last edition : 2021/29/7
%
path_code = cd;
addpath(genpath([path_code '\sup']))

%% Psychtoolbox testing

PsychtoolboxVersion % shows your psychtoolbox version

UpdatePsychtoolbox  % updates your psychtoolbox version

help PsychDemos  % shows your psychtoolbox demos

KbDemo % keyboard demo

%% Screen Test
ScreenTest()  % Screen Test --> after running the code press 0 to test your screen

%% Tests Sync
VBLSyncTest() % Tests Sync

%%  Perceptual VBL Sync Test
PerceptualVBLSyncTest() % Perceptual VBL Sync Test
%%instructions on how to install the kernel driver
help PsychtoolboxKernelDriver % instructions on how to install the kernel driver

%% The Screen command
help Screen % Screen() is the heart of Psychtoolbox

%% The Screen command
% Screen('OpenWindow?')
%For explanation of any particular screen function, just add a question
% mark "?". E.g. for 'OpenWindow'--> Screen OpenWindow?

%%
Screen()

%% The Screen command
Screen DrawLine?

%% Using the Screen command
Screen('Preference', 'SkipSyncTests', 1);
Screen('Screens')

max(Screen('Screens'))

ScreenNumber=max(Screen('Screens'));
[windowPtr,rect]=Screen('OpenWindow',ScreenNumber);

%% Flip screen
% flipTime
Screen('Preference', 'SkipSyncTests', 1);
wPtr = Screen('OpenWindow',max(Screen('Screens')));
Screen('Flip',wPtr);
pause

clear Screen;

%% Time
Screen('Preference', 'SkipSyncTests', 1);
wPtr = Screen('OpenWindow',max(Screen('Screens')));
now = GetSecs();
aLittleLater = GetSecs();
gap = aLittleLater - now;

VBLtime = Screen('Flip',wPtr, [gap], [0]); % when: you can specify a time in the future for the flip to take place

pause

clear Screen;                                                    %    dontclear: Default is to clear the back buffer.  However in some cases you may want to leave the back buffer as is.  Default is 0, set to 1 if you don't want it to clear.

%% Using Screen -> drawSomething()
Screen('Preference', 'SkipSyncTests', 1);

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));  %open the screen
Screen('FillRect', wPtr, [255 0 0],[100 100 500 500]);      %draw a rectangle on the back buffer
Screen('Flip',wPtr);                                        %flip the buffers
KbWait();                                                   %wait until key pressed

clear Screen;

%% WaitSecs(s)
%
% WaitSecs('UntilTime',when)
%
% KbWait()

%% KbWait
[secs, keyCode, deltaSecs] = KbWait()  % keyCode is a vector of all the keys, with a 1 for any key that was pressed.

%find(keyCode) will return the index of the button(s) pressed.

%That code can then be turned into a character using KbName()

%% KbWait Example
WaitSecs(1);
[secs, keyCode, deltaT] = KbWait();

find(keyCode)    % if you press ((Space)) key the result will be : 32

KbName(32)       % answer: space

KbName('space')  % answer: 32

%% %%%%%%%%%%%%%%%%% example 1 %%%%%%%%%%%%%%%%%%%%%%%%
WaitSecs(1);[secs, keyCode, deltaT] = KbWait();
z=find(keyCode)
KbName(z)

%% Drawing simple shapes --> FillRect

Screen FillRect?

Screen('Preference', 'SkipSyncTests', 1);
[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')),[128 128 128]); % open black window

% Screen('FillRect', windowPtr, [color], [rect] );
Screen('FillRect', wPtr, [255 0 0],[100 100 500 500]);  %draw red rect
Screen('Flip',wPtr);
KbWait();                                                   %wait until key pressed
clear Screen;

%% FillRect more

Screen('Preference', 'SkipSyncTests', 1);
[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')),[128 128 128]); % open black window

% Screen('FillRect', windowPtr, [color], [rect] );
Screen('FillRect', wPtr, [255 0 0],[100 100 500 500]);  %draw red rect
Screen('FillRect', wPtr, [0 0 255],[800 300 1300 500]);  %draw red rect
Screen('FillRect', wPtr, [255 0 255],[1000 1000 1500 1300]);  %draw red rect

Screen('Flip',wPtr);
KbWait();                                                   %wait until key pressed

clear Screen;

%% %%%%%%%%%% function drawSomething()

%% Drawing simple shapes

drawSomething()

%% frame Duration
Screen('Preference', 'SkipSyncTests', 1);

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));  %open the screen
frameDuration = Screen('GetFlipInterval',wPtr)

KbWait();

clear Screen;


%% Drawing multiple rects
Screen('Preference', 'SkipSyncTests', 1);

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));
rectOne   = [100 100 250 400];
rectTwo   = [250 400 300 450];
bothRects = [rectOne', rectTwo'];

Screen('FillRect',wPtr,[0 255 0],bothRects);
Screen('Flip',wPtr)

KbWait();                                                   %wait until key pressed

clear Screen;

%% Centering
Screen('Preference', 'SkipSyncTests', 1);

[wPtr,rect]   = Screen('OpenWindow',max(Screen('Screens')));

screenWidth   = rect(3);
screenHeight  = rect(4);
screenCenterX = screenWidth/2;
screenCenterY = screenHeight/2;

myRectWidth   = 100;
myRectHeight  = 100 ;

myRectLeft    = screenCenterX - myRectWidth/2;
myRectTop     = screenCenterY - myRectHeight/2;
myRectRight   = myRectLeft + myRectWidth;
myRectBottom  = myRectTop + myRectHeight;
myRect        =  [myRectLeft, myRectTop, myRectRight, myRectBottom];

Screen('FillRect',wPtr,[0 0 255],myRect);
Screen('Flip',wPtr);
KbWait();                                                   %wait until key pressed

clear Screen;

%% Centering
Screen('Preference', 'SkipSyncTests', 1);

[wPtr,rect]   = Screen('OpenWindow',max(Screen('Screens')));

screenWidth   = rect(3);
screenHeight  = rect(4);
screenCenterX = screenWidth/2;
screenCenterY = screenHeight/2;

myRectWidth   = 100;
myRectHeight  = 100 ;

myRect        =  [0, 0, myRectWidth, myRectHeight];

myRect        = CenterRect(myRect,rect);
Screen('FillRect',wPtr,[0 0 255],myRect);
Screen('Flip',wPtr);
KbWait();                                                   %wait until key pressed

clear Screen;


%% Drawing circles
Screen('Preference', 'SkipSyncTests', 1);

[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));

Screen('FillRect',wPtr,[0 0 255],myRect)

Screen('FillOval',wPtr,[255 0 0 ],myRect)

Screen('Flip',wPtr);

KbWait();                                                   %wait until key pressed

clear Screen;

%% Alpha blending

% Screen BlendFunction?

Screen('Preference', 'SkipSyncTests', 1);
[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));

Screen('BlendFunction',wPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA); %ENABLE BLENDING


Screen('BlendFunction',wPtr,GL_ONE,GL_ZERO); % DISABLE BLENDING
%show them
Screen('Flip',wPtr) 
KbWait();                                                   %wait until key pressed

clear Screen;
%% Alpha blending
 
%open screen
Screen('Preference', 'SkipSyncTests', 1);
[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));

% Turn on alpha blending
Screen('BlendFunction',wPtr,GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);

%Define Colors

color1    =[0 255 0 255];
color2    =[0 0 255 100];

%Draw Shape
Screen('FillRect',wPtr,color1,[300 300 400 400]);
Screen('FillRect',wPtr,color2,[350 350 450 450]);

%show them
Screen('Flip',wPtr)

KbWait();                                                   %wait until key pressed

clear Screen;

%% Draw Dots
Screen('Preference', 'SkipSyncTests', 1);

[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));
xCenter     = rect(3)/2;
yCenter     = rect(4)/2;

colors      = [255 0 0; 0 255 0; 0 0 255];
locations   = [-100 0 100; 0 0 0];
sizes       = [1 10 20]; 

Screen('DrawDots',wPtr,locations, sizes, colors, [xCenter,yCenter], 1);
Screen('Flip',wPtr);

KbWait();                                                   %wait until key pressed
clear Screen;

%% DrawLines

[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));

xCenter     = rect(3)/2;
yCenter     = rect(4)/2;

lines       = [-300 300 -300 300; -50 -50 50 50];

colors      = [255 0 0 255; 0 0 0 0 ; 0 255 255 0];


Screen('DrawLines',wPtr,lines,7,colors,[xCenter,yCenter],0);
Screen('Flip',wPtr);

KbWait();                                                   %wait until key pressed

clear Screen;

%% Drawing a fixation cross
drawFixationCross();

%% Drawing a fixation cross
crossLengh=10;
crossWidth=5;
crossColor=0;

[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));
drawFixationCross1  (wPtr,rect,crossLengh,crossColor,crossWidth);
%draw a Fixation Cross in center
% drawFixationCross (wPtr,rect,crossLengh,crossColor,crossWidth)

%set start & end points of line

%% Animation
Screen('Preference', 'SkipSyncTests', 1);

[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));

xCenter     = rect(3)/2;
yCenter     = rect(4)/2;
rect_out=[0 0 200 200];
white = WhiteIndex(wPtr);
for i=1:100
    movie(i)=Screen('OpenOffscreenWindow', wPtr, 0, rect_out);
    Screen('FillOval', movie(i), white, [0 0 2*(i-1) 2*(i-1)]);
end;

% show movie
for i=[1:100 100:-1:1] % forwards and backwards
    Screen('CopyWindow',movie(i),wPtr,rect_out,rect_out);
    Screen('Flip', wPtr);
end;
Screen('CloseAll');

%% Animation

colorLoop();

%% Drawing text

% Screen('TextSize',wPtr,size);
% Screen('TextFont',wPtr,fontString);
% Screen('TextStyle',wPtr,style);


[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens')));
Screen('Flip',wPtr);
Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,48);
Screen('DrawText',wPtr,'Hello there',100,100,[0 0 0]);
Screen('Flip',wPtr);
KbWait();                                                   %wait until key pressed

clear Screen;

%% Drawing Text


[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));
myText = 'The experiment\nIs about to begin';
DrawFormattedText(wPtr,myText,'center',rect(4)/2,0);
Screen('Flip',wPtr);
KbWait();                                                   %wait until key pressed

clear Screen;

%% %%%%%%%%%%%%%%%%% example of drawing Shapes %%%%%%%%%%%%%%%%%%%%%%%%

%% DrawLine

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));

% Screen('DrawLine', windowPtr ,[color], fromH, fromV, toH, toV ,[penWidth]);
Screen('DrawLine', wPtr  , [135 10 200],800  ,700 ,100, 500, 5);

Screen('Flip',wPtr);

KbWait();                                                   %wait until key pressed

clear Screen;

%% FillOval
Screen('Preference', 'SkipSyncTests', 1);
[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));

% Screen('Flip',wPtr);
% Screen('FillOval', windowPtr [,color] [,rect] [,perfectUpToMaxDiameter]);
Screen('FillOval', wPtr, [255 128 0],[400 400 500 500]);

Screen('Flip',wPtr);

KbWait();                                                   %wait until key pressed

clear Screen;

%% DrawArc
Screen('Preference', 'SkipSyncTests', 1);

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));
% Screen('DrawArc',windowPtr,[color],[rect],startAngle,arcAngle)
Screen('DrawArc', wPtr, [140 125 180],[100 100 500 500],0,180)

Screen('Flip',wPtr);

KbWait();                                                   %wait until key pressed

clear Screen;

%% DrawDots
Screen('Preference', 'SkipSyncTests', 1);

xy=[1000 500 ;  400 900];

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));

% Screen('DrawDots', windowPtr, xy [,size] [,color] [,center] [,dot_type]);
Screen('DrawDots', wPtr, xy ,10,[255 0 0],[0 0],4)

Screen('DrawDots', wPtr, xy+50 ,10,[0 255 0],[0 0],1)

Screen('DrawDots', wPtr, xy+150 ,10,[0 0 255],[0 0],2)

Screen('Flip',wPtr);

KbWait();                                                   %wait until key pressed

clear Screen;

%% FrameRect
Screen('Preference', 'SkipSyncTests', 1);

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));

% Screen('FrameRect', windowPtr [,color] [,rect] [,penWidth]);
Screen('FrameRect', wPtr, [0 255 255],[100 100 500 500],3)
 
Screen('Flip',wPtr);
%flip the buffers
KbWait();                                                   %wait until key pressed

clear Screen;

%% FrameArc
Screen('Preference', 'SkipSyncTests', 1);

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));

% Screen('FrameArc',windowPtr,[color],[rect],startAngle,arcAngle[,penWidth] [,penHeight] [,penMode])
Screen('FrameArc', wPtr, [0 255 0],[100 100 500 500],0,180,5)

Screen('Flip',wPtr);
%flip the buffers
KbWait();                                                   %wait until key pressed

clear Screen;

%% FramePoly
Screen('Preference', 'SkipSyncTests', 1);

[wPtr, rect] = Screen('OpenWindow',max(Screen('Screens')));

% Screen('Flip',wPtr); 
% Screen('FramePoly', windowPtr [,color], pointList [,penWidth]);
pointList=[300 500;100 600;800 390;150 300;400 890];
Screen('FramePoly', wPtr, [255 128 0],pointList);

Screen('Flip',wPtr);

KbWait();                                                   %wait until key pressed

clear Screen;