%----------------------------------------------------------------------------
%        Experimental Parameters
%        DO NOT MODIFY between subjects within one experiment
%----------------------------------------------------------------------------
% Daw's timing: choice time 2s (2x), stimulus faded on top: 3s (2x), feedback: 1.5s,
% mean jittered ITI (fMRI), one trial: 13.5s

% General parameters of the experiment
if dotraining;	Z.Ntrials = 41;  nt0=9; 	    % number of dotraining trials & actual start trial
else			   Z.Ntrials = 134; nt0=1;      % number of trials  & actual start trial
end
if debug;      Z.Ntrials = 12;end

Z.p = .7;                                       % probability of correct transition 

% Screen Times:
Z.max_choice_time       =  2;                   % maximal time to respond sec
% stimulus is shown with a frame at the same position for Z.max_choice_time-reaction time (RT)  
Z.display_choice_ontop  =  1.5;                 % duration to highlight choice with frame in upper panel of display 
Z.display_fb            =  1.5;                 % duration to display feedback
Z.min_display_fix_cross =  1;                   % minimum display of fixation cross 
Z.text_fb_too_slow      = 'Zu langsam!';        % display text if no choice was given
Z.show_missing_sign     = 2;                    % duration of warn screen after no choice was given

Z.SelfStatement_TimeLimit   = 20
Z.SelfStatement_warningTime = 10


% Settings for payout 
maxpayout=7.5; 		  % maximal payout in Euro 
minpayout = 2.5;      % minimal payout in Euro 
if dotraining == 1; minpayout= 0;end
payoutpertrial=0.2;	% payout per trial (win or loss)

%....................... keys 

KbName('UnifyKeyNames');

%----------------------------------------------------------------------------
%        Keyboard / input device settings 
%----------------------------------------------------------------------------

% Check Keycodes with Keycode_Translator to be sure!

if     strcmpi(devicetype,'keyboard'); % if using keyboard // Careful! Assumes American Keyboard so z and y are switched maybe other things too
	keyleft			= 'y';			% left key MAC z but in Potsdam y
	keyright		= '.>';			% right key .> codes for .
	instrforward	=  keyright;
	instrbackward	=  keyleft;
	usekbqueue      = 1;
elseif strcmpi(devicetype,'lumitouch');	 % for lumitouch device
	keyleft			= '4';		% left key, responsbox
	keyright		   = '7';		% right key, responsbox
	instrforward	= '7';		% index finger of non-dominant hand
	instrbackward	= '4';		% third finger of non-dominant hand
    usekbqueue      = 1;
% elseif strcmpi(devicetype,'nnl'); %	 for NNL device
% 	keyleft			= '6';			% left key, responsbox
% 	keyright		= '1';			% right key, responsbox
% 	instrforward = 'b';	% index finger of non-dominant hand
% 	instrbackward  = 'c';	% third finger of non-dominant hand
%	usekbqueue     = 1;
elseif strcmpi(devicetype,'currentdesignsINSIDE')
	% two response devices with four buttons each, button numbers for
	% the right hand devices from 1 at the top to four and for
	% the left hand device from 6 at the bottom to 9 at the top
	% number 5 is the fMRI trigger
	keyleft			= '6';			% left key, responsbox
	keyright		= '1';			% right key, responsbox
	instrforward	= keyright;		% right key for changing instruction page
	instrbackward	= keyleft;		% left key for changing instruction page
	usekbqueue     = 0;
elseif strcmpi(devicetype,'currentdesignsOUTSIDE')
	keyleft			= '1';			% left key, responsbox
	keyright		= '4';			% right key, responsbox
	instrforward	= keyright;		% right key for changing instruction page
	instrbackward	= keyleft;		% left key for changing instruction page
	usekbqueue     = 1;
else
	error('Unknown device type')
end

% start queue for KbQueueCheck 
if usekbqueue; 
	KbQueueCreate; 
	KbQueueStart; 
end



%----------------------------------------------------------------------------
%        MRI triggers 
%----------------------------------------------------------------------------

MRITriggerCode	= 's'; 
NumInitialfMRITriggers	= 4; 
NumFinalfMRITriggers	= 10;


%----------------------------------------------------------------------------
%        ITIs for scanning
%----------------------------------------------------------------------------
% load predefined variable 'ITI_final' containing exponentialy distributed values
% between 1 and 7 (including fixation cross 1s): 
% min 1.015, max 7.000, mean 2.029, total ITI 3.448, total dur: shortversion 35.2730  ("Daw timing"  45.4550)
load('ITI_min0_max6_TwoStep_201.mat'); 
ITI_final = ITI_final(randperm(Z.Ntrials)); 


