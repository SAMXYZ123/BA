fprintf('............ Setting up the screen   \n');

%................... colours (in RBG)
bgcol 		= [0 0 0];	% this is just in grayscale (each value separately)
white 		= [200 200 200];
hard_white  = [255 255 255];
black 		= [0 0 0]; 
gray1   	= [70 70 70];
gray2       = [190 190 190];
gray3       = [150 150 150];
red 		= [255 50 50]; 
blue 		= [120 120 255]; 
green 		= [30 255 30]; 
purple		= [148 0 211];
brown		= [205 133 63];
chartreuse 	= [127 255 0];
yellow		= [250 250 50]; 
purple		= [150 0 150];
txtcolor 	= hard_white;
scaleColor = [1]; % For SelfStament Scale

% General text/stimulus settings for experiment
txtsizefrac = 0.03;                     % text size as fraction of screen height!
blw         = .3;                      % width of stimulus as fraction of **xfrac**
blh         = .3;                      % height of stimulus as fraction of **xfrac**

% The total number of characters allowed per line
TotalCharacterWrap = 50;


%................... open a screen
AssertOpenGL;
Screen('Preference','Verbosity',0);

screenNumber = max(Screen('Screens'));	% select the last monitor. Alternatively Set to Screen Number starting with zero for the first

if debug; 
	Screen('Preference','SkipSyncTests',2); % ONLY do this for quick debugging;
	wd=Screen('OpenWindow',0,bgcol(2),[0 0 600 400],[],2,[],[]); % Make small PTB screen on my large screen
else
   Screen('Preference','SkipSyncTests',2);
	wd=Screen('OpenWindow', screenNumber,bgcol(2),[],[],2,[],[],[]);			% Get Screen. This is always size of the display.   
end 
KbName('UnifyKeyNames');        % need this for KbName to behave
Screen('BlendFunction', wd, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');  

%---------------------------------------------------------------------------
%                    SCREEN LAYOUT
%---------------------------------------------------------------------------
[wdw, wdh]=Screen('WindowSize', wd);	% Get screen size 

%................... Presentation coordinates 
xfrac=.6; 			   % fraction of x width to use 
yfrac=.6; 			   % fraction of y height to use 


visAngFrac = 1.0;
x0=(1-xfrac)/2*wdw; 	% zero point along width 
y0=(1-yfrac)/2*wdh;	% zero point along height

xl0=xfrac*wdw; 		% width to use in pixels
yl0=yfrac*wdh; 		% height to use in pixels
yposm = 'center';

% adjust text size 
txtsize = ceil(wdh * txtsizefrac);
txtlarge = ceil(1.5*txtsize);
Screen('TextSize',wd,txtsize);	% Set size of text

%Main experiment: 
%.................... The squares 
boxc = x0+round([xl0*1/6 xl0*5/6 xl0*3/6]); % x centres left/right [1 1 0] third of fracdisplay and middle third of disply [0 0 1]
boxc2 = [0 170 170];

boxcy= y0+round([ yl0*.75  yl0*.75  yl0*.0833]); % .0833 = (.25*wdh-y0)/yl0
% y centres left/right [1 1 0] third of fracdisplay and middle third of disply [0 0 1]

% boxlines 
box0 = round([-blw*xl0 -blh*xl0 blw*xl0 blh*xl0]/2);

% each box
for k=1:3;
	if k == 3 % middle third box in upper panel of display
        box  (k,:) = round(     box0 + [boxc(k)  boxcy(k)  boxc(k)  boxcy(k)]);	% main, slightly smaller, box 
		boxl (k,:) = round( 1.1*box0 + [boxc(k)  boxcy(k)  boxc(k)  boxcy(k)]);	% slightly larger box 
        box2 (k,:) = round([0.6*box0 + [boxc2(k) boxcy(k)  boxc2(k) boxcy(k)]]+[0 100*visAngFrac 0 100*visAngFrac]);  % smaller stim1 for instructing probabilities
        %box (k,:) =       box0 + [boxc(k)  .25*wdh boxc(k)  .25*wdh];	% main, slightly smaller, box 
		%boxl (k,:) =  1.1*box0 + [boxc(k)  .25*wdh boxc(k)  .25*wdh];	% slightly larger box 
        %box2 (k,:) = [0.6*box0 + [boxc2(k) .25*wdh boxc2(k) .25*wdh]]+[0 100 0 100];  % smaller stim1 for instructing probabilities
	else
		box  (k,:) =      box0 + [boxc(k)  boxcy(k) boxc(k)  boxcy(k)];	% main boxes 
        boxl (k,:) =  1.1*box0 + [boxc(k)  boxcy(k) boxc(k)  boxcy(k)];	% slightly larger boxes
        box2 (k,:) = [0.6*box0 + [boxc2(k) boxcy(k) boxc2(k) boxcy(k)]]+[0 45 0 45];	% smaller stim2 for instructing probabilities
	end
end
boxo      = 0.6*box0*visAngFrac + [boxc(3) y0+yl0*2/3  boxc(3) y0+yl0*2/3];	% central box for outcomes  % 2/3 = (.6*wdh-y0)/yl0


%.................... load stimuli 
for k=1:2
   if dotraining | second_run
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S1_'   num2str(k)   '.png'');']);         stim  (1,k)=Screen('MakeTexture',wd,tmp); %First Step Stimulus = Gray
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S2_1_' num2str(k)   '.png'');']);         stim  (2,k)=Screen('MakeTexture',wd,tmp); % Second Step Stimulus no.1
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S2_2_' num2str(k)   '.png'');']);         stim  (3,k)=Screen('MakeTexture',wd,tmp); % Second Step Stimulus no.2
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S1_'   num2str(k)   '_chosen.png'');']);  stimch(1,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S2_1_' num2str(k)   '_chosen.png'');']);  stimch(2,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S2_2_' num2str(k)   '_chosen.png'');']);  stimch(3,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S1_'   num2str(k)   '_fade.png'');']);    stimfa(1,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S2_1_' num2str(k)   '_fade.png'');']);    stimfa(2,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S2_2_' num2str(k)   '_fade.png'');']);    stimfa(3,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S1_both.png'');']);                       stimboth(1)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S2_1_both.png'');']);                     stimboth(2)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/setT' num2str(trainingset) '/S2_2_both.png'');']);                     stimboth(3)=Screen('MakeTexture',wd,tmp);
   else
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S1_' num2str(k)       '.png'');']);       
      
      stim  (1,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S2_1_' num2str(k)  '.png'');']);       
      
      stim  (2,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S2_2_' num2str(k)     '.png'');']);       
      
      stim  (3,k)=Screen('MakeTexture',wd,tmp);
      
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S1_' num2str(k)       '_chosen.png'');']); 
      
      stimch(1,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S2_1_' num2str(k)  '_chosen.png'');']); 
      
      stimch(2,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S2_2_' num2str(k)     '_chosen.png'');']); 
      
      stimch(3,k)=Screen('MakeTexture',wd,tmp);
      
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S1_' num2str(k)       '_fade.png'');']);  
      
      stimfa(1,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S2_1_' num2str(k)  '_fade.png'');']);  
      
      stimfa(2,k)=Screen('MakeTexture',wd,tmp);
      eval(['tmp=imread(''imgs/set' num2str(trialset) '/S2_2_' num2str(k)     '_fade.png'');']);  
      
      stimfa(3,k)=Screen('MakeTexture',wd,tmp);
   end
end

% Load Outcome stimuli 

if wintrial % experiment is set to win/no-win in modifyme
        eval(['tmp=imread(''imgs/euro20_black.png'');' ]);
        
        outcome(1)=Screen('MakeTexture',wd,tmp);

        rew_txt  = 'Gewonnen!';
        rew_cent = ['+ 20 Cent'];
        rew_col  = green;
        
        pun_txt  = 'Kein Gewinn.';
        pun_cent = ['0 Cent'];
        pun_col  = gray2;
        
        eval(['tmp=imread(''imgs/noout.png'');']);
        outcome(2)=Screen('MakeTexture',wd,tmp);
        
else % experiment is set to loss/no-loss in modifyme
        eval(['tmp=imread(''imgs/noout.png'');']);
        outcome(1)=Screen('MakeTexture',wd,tmp);
       
        eval(['tmp=imread(''imgs/euro20_black_cross.png'');' ]); 
        outcome(2)=Screen('MakeTexture',wd,tmp);

        rew_txt  = 'Kein Verlust.';
        rew_cent = ['0 Cent'];
        rew_col  = gray2;
    
        pun_txt  = 'Verloren!';
        pun_cent = ['- 20 Cent'];
        pun_col  = red;
        
end



%For instructions:
%.................... Arrows

eval(['tmp=imread(''imgs/arrows.tif'');'])
tmp(tmp==255)=bgcol(2);
arrowsquare(1,:)=[wdw*.84 wdh*.92 wdw*.98 wdh*.98];

arrow=Screen('MakeTexture',wd,tmp);


%.................... Instructions positions
addpath('instrfuncs');
yposm = 'center'; ypost = .1*wdh; ypostt=.05*wdh;

%.................... load graphs
%%%% for WIN Trials folder name is "1" for Loss Trials folder name is "0"
    for k=0:6;
        eval(['tmp=imread(''instrfuncs/' num2str(wintrial) '/samplefig' num2str(k)   '.jpg'');']); instrfig(1,k+1)=Screen('MakeTexture',wd,tmp);
    end
    for k=1:32
        eval(['tmp=imread(''instrfuncs/' num2str(wintrial) '/samplefig4_' num2str(k)   '.jpg'');']); instrfigsamples(1,k)=Screen('MakeTexture',wd,tmp);
    end
    
    
	
%.................... box for graphs & instruction figures
tmp = size(tmp);
tmpy = yl0;
tmpx = ceil(yl0*tmp(2)/tmp(1));
instrfigbox = [wdw/2-tmpx/2 wdh/2-tmpy/2 wdw/2+tmpx/2 wdh/2+tmpy/2];
instrboth(1,:) = ceil([  wdw/3-blw*xl0/1.4 wdh/2-blw*xl0/2.2        wdw/3+blw*xl0/1.4     wdh/2+blw*xl0/2.2]);
instrboth(2,:) = ceil([2*wdw/3-blw*xl0/1.4 wdh/2-blw*xl0/2.2      2*wdw/3+blw*xl0/1.4     wdh/2+blw*xl0/2.2]);
instrboth(3,:) = ceil([  wdw/2-blw*xl0/1.4 wdh/2-blw*xl0/2.2        wdw/2+blw*xl0/1.4     wdh/2+blw*xl0/2.2]);

% each box for instructions with all stimuli (1st-->2nd step)
for k=1:3;
	if k == 3 % middle third box in upper panel of display
		instrall(k,:) =     box0 + [boxc(k) .40*wdh boxc(k) .40*wdh];	% main, slightly smaller, box 
	else
		instrall(k,:) =     box0 + [boxc(k) .75*wdh boxc(k) .75*wdh];	% main boxes 
    end
end


% monitor frame rate
[monitorFlipInterval nrValidSamples stddev] = Screen('GetFlipInterval', wd);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% SELF STATEMENT SCREEN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the scale properties
    scaleWidth = 0.6 * wdw;
    scaleHeight = 0.008 * wdh;
    scaleXPos = wdw/2;
    scaleYPos = wdh/2;
    frameWidth = 1; % Frame width
    barWidth = 0.5;

    scaleRect = [scaleXPos - scaleWidth/2, scaleYPos - scaleHeight/2, scaleXPos + scaleWidth/2, scaleYPos + scaleHeight/2]; % Input rect
    frameRect = [scaleRect(1) - frameWidth, scaleRect(2) - frameWidth, scaleRect(3) + frameWidth, scaleRect(4) + frameWidth]; % Input Frame

    % TEXT for Questions and Ankers 
    question = 'Im Moment vor dieser Abfrage war Ihre Aufmerksamkeit vollständig fokussiert auf: ...'; %'In the moment prior to the probe, was your attention focused: ... ';
    anker_text_A = 'Ihre Aufgabe'; %'completely on \nthe task';
    anker_text_B = 'anderweitige \nBelange'; %'completely on \nunrelated concerns';
    anker_text_B_2='anderweitige'; %to get the right Text width

    % Calculate the position to center the text on the x-axis
    questRect = Screen('TextBounds', wd, question);
    questWidth = questRect(3) - questRect(1);
    questXPos = (wdw - questWidth) / 2;
    questYPos = (wdh / 4);  % Adjust the vertical position as desired

    anker_text_A_rect = Screen('TextBounds', wd, anker_text_A);
    anker_text_A_width = anker_text_A_rect(3) - anker_text_A_rect(1);
    
    anker_text_B_rect = Screen('TextBounds', wd, anker_text_B_2);
    anker_text_B_width = anker_text_B_rect(3) - anker_text_B_rect(1);
    
    % Variable to change anker sides --> change later so pseudorandom
    % matrix

    % Define the bar properties
    barHeight = scaleHeight * 3; % Adjust the height of the bar as desired

    % Calculate the y-position of the bars
    barYPos = scaleYPos - barHeight/2;

    % Calculate the x-positions for the bars
    barXPosStart = scaleXPos - scaleWidth / 2 + barWidth;
    barXPosEnd = scaleXPos + scaleWidth / 2 - barWidth;
    barXPosQuarter1 = scaleXPos - scaleWidth / 4 + barWidth;
    barXPosQuarter3 = scaleXPos + scaleWidth / 4 - barWidth;
    barXPosMiddle = scaleXPos;
    
    % Set the color and size of the custom cursor shape
    cursorColor = gray1;  
    cursorFrameColor = gray3;  
    cursorSize = 15;          
