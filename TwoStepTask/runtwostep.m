%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%Main script to run two-step task (modified from Daw et al, 2011) %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear all; close all;   % Tabula rasa

modifymeTWOSTEP;   % set the subject-specific experimental parameters
expparams;         % experimental parameters *NOT* to be modified between subjects
preps;             % preparations: set up stimulus sequences, left/right etc. 

try    % this is important: if there's an error, psychtoolbox will crash graciously
       % and move on to the 'catch' block at the end, where all screens etc are
       % closed. 
 
   setup;   % set up the psychtoolbox screen and layout parameters 
            % this includes things like positioning of stimuli and 
            % loading the stimuli into psychtoolbox 
            
            
   HideCursor(wd); % Hide the cursor

   %---------------------------------------------------------------------------
   if  dotraining % do instructions or not 
            
       fprintf('............. Instructions \n');
       T.instr_start = GetSecs;
       instructions_dawlike;
       T.instr_end = GetSecs;
       
       pretraininginstr; %Instruct Training
       %%% Training Session
       instr_steps = 0; %activate second step
       for nt = 8:Z.Ntrials
            twosteptrial;
            if Z.interval_sequence(nt)
                SelfStatement;
            else 
                V.SelfStatement_reactionTime(nt)=NaN;
                
                V.SelfStatement_choiceTime(nt)=NaN;
                
                V.MindWanderingValue(nt)=NaN;
            end
       end
       
       % Post Training Routine
       % Calculate Win
       
       rand_trials    = randperm(Z.Ntrials);
       rand_trials    = rand_trials(rand_trials>8);
       payout_trials  = rand_trials(1:(Z.Ntrials-8)/3);
       
     
       if wintrial
            payout=min(max(payoutpertrial*(sum(R(payout_trials))),minpayout),maxpayout); % limit: 0 to maxpayout
   
       else
            payout=max(maxpayout - payoutpertrial*(sum(~R(payout_trials))),minpayout); % limit: 0 to maxpayout
       end
       
       post_training; % Post Training Instruction
       
       %%% New Parameters for actual Experiment
       dotraining=0;
       second_run=0;
       clear_variables;
       setup;
       expparams;
       preps;
       
       
   elseif second_run==1
       instructions_dawlike_short;
       
       %%% New Parameters for actual Experiment
       dotraining=0;
       second_run=0;
       clear_variables;
       setup;
       expparams;
       preps;
   end
       
   T.refresher_start =  GetSecs;
      
      
   refresher;
      
   good_luck; 
   T.refresher_end = GetSecs;


   T.time_begin = GetSecs;

 %---------------------------------------------------------------------------
      fprintf('............. Starting actual experiment \n');

   instr_steps = 0;

   T.exp_start = GetSecs;
   for nt = nt0:Z.Ntrials
      twosteptrial;
     
     if Z.interval_sequence(nt)      
     SelfStatement;
     else
           V.SelfStatement_reactionTime(nt)=NaN;
                
           V.SelfStatement_choiceTime(nt)=NaN;
                
           V.MindWanderingValue(nt)=NaN;
     end
          
   end
   T.exp_end = GetSecs;

   %---------------------------------------------------------------------------
   fprintf('............. Acquiring final volumes / Baseline\n');

   Screen('TextSize',wd,txtlarge);
   DrawFormattedText(wd,'+','center','center',txtcolor);
   Screen('TextSize',wd,txtsize);
   T.baseline_end = Screen('Flip',wd);

   
   WaitSecs(5-monitorFlipInterval); % 5 sec baseline before experiment ends 
   
   %---------------------------------------------------------------------------
   fprintf('............. payout & end of experiment \n');

   
   rand_trials    = randperm(Z.Ntrials);
   payout_trials  = rand_trials(1:Z.Ntrials/3);
   
   
   if wintrial
       payout=min(max(payoutpertrial*(sum(R(payout_trials))),minpayout),maxpayout); % limit: 0 to maxpayout
   
   else
       payout=max(maxpayout - payoutpertrial*(sum(~R(payout_trials))),minpayout); % limit: 0 to maxpayout
   end
   
       
   post_exp_instr;
   
   T.end = GetSecs;
    
   %---------------------------------------------------------------------------
	if dosave; 
        fprintf('saving important variables and parameters in structs and csv\n');
        Analysis_ReadMe; 
		fprintf('saving all in two separate files\n');
		eval(['save data' filesep namestring_short  '.mat']);
		eval(['save data' filesep namestring_long '.mat']);
	end
   
   ShowCursor; % show the mouse cursor again 
   Screen('CloseAll');
    
    %----------------------------------------------------------------------
catch % execute this if there's an error, or if we've pressed the escape key

   if aborted==0;    % if there was an error
      fprintf(' ******************************\n')
      fprintf(' **** Something went WRONG ****\n')
      fprintf(' ******************************\n')
      if dosave; eval(['save data/' namestring_long  '.crashed.mat;']);end
   elseif aborted==1; % if we've abored by pressing the escape key
      fprintf('                               \n')
      fprintf(' ******************************\n')
      fprintf(' **** Experiment aborted ******\n')
      fprintf(' ******************************\n')
      if dosave; eval(['save data/' namestring_long  '.aborted.mat;']);end
   end
   Screen('CloseAll'); % close psychtoolbox, return screen control to OSX
   rethrow(lasterror)
   psychrethrow(psychlasterror)
   ShowCursor; % show the mouse cursor again 
end
