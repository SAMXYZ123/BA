%----------------------------------------------------------------------------
%        MAIN FILE TO EDIT
%        This is the only file that should demand any changes!!!
%----------------------------------------------------------------------------
fprintf('............ Setting basic parameters according to \n')
fprintf('............            MODIFYME.M\n'); 
fprintf('............ \n')


debug       = 0;

%        To save or not to save
%        This should ALWAYS be set to 1 when doing experiments obviously
%----------------------------------------------------------------------------
dosave   = 1;      % save output? 

%----------------------------------------------------------------------------
%      Set Paramter manually or according to Subject-List

manual_parameters = 0;
%----------------------------------------------------------------------------

if manual_parameters
    
    % Only set to 1 if its the First Time the Subject is doing a Experimental Run
    % You will have to restart the script for the actual experimental run
    dotraining   = 0;   % 0: main experimental session
                        % 1: training session     

    % Is it the second run of the first experimental session?                  
    second_run = 0   % 1: YES, it is the second run of the first experiment
                     % 0: NO, it is any other run in any session



    %----------------------------------------------------------------------------

    %        Which image-set should be used for stimulus?

    trainingset  = 1;    % 1 gray, blue, green in training
                         % 2 gray, green, rosa in training

    trialset     = 1;    % 1 gray, orange, purple
                         % 2 grey, turkoise, yellow
                         % 3 grey, beige, brown
                         % 4 grey, cyan, salmon

    %----------------------------------------------------------------------------

    %        win/no-win or loss/no-loss trials

    wintrial  = 1;    % 1 win / no-win
                      % 0 loss / no-loss

    %----------------------------------------------------------------------------


    %----------------------------------------------------------------------------
    %        Patient Information 
    %--------------------------------------------------------------------------
    project  = '1';		  % Project ID - either '1' or '2' 
    type     = 'X';     % 'C' for controls, and 'P' for patients 
    name     = 'XX';    % Subject initials *** have to be in single quotes ***
    payment  = 1;       % is this subject being paid / should payment info be displayed
                        % at the end? 
    subjn    = '1';  % Subject Number. This number has to be > 1000 
                        % *** subject number has to be in single quotes ***
    session  = '1';     % Which session (first time, or follow-up?)
    age      = 00;      % subject's age in years 
    sex      = 'w';     % subject's sex; 'm' = male; 'f' = female
                        % please make sure this is a string, i.e. in single quotes
    exploc   = 'd';     % 'b' for berlin, 'd' for dresden 
    
else
    load('Exp_Conditions.mat'); % Load Experiemental Conditions for every Subject 
    automaticparameters; % Script that interacts with user in command window in order to set parameters right
end

%----------------------------------------------------------------------------
%        Input device type & handedness inside and outside the scanner
%        Device can be: 'keyboard', 'lumitouch', 
%                        'currentdesignsINSIDE' or 'currentdesignsOUTSIDE'
%----------------------------------------------------------------------------
devicetype   = 'keyboard';    

%----------------------------------------------------------------------------
%        EXPERIMENT VERSION 
%        PLEASE check this is correct! 
%----------------------------------------------------------------------------
expversion = 'twostep-4.1.130628';
