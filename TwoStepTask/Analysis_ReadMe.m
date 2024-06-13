%% Define Structures with Variables for Analysis
%% V. for Output
%% D. for Input
%% Z. for Experiment

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output

% Reward: 
V.R = R; 
% Reward Probabilities for Chosen Stimuli
V.Prob = Prob;

% ReactionTime for Choices -> RT
V.RT = RT; 
    
% Which stimuli was chosen controlled for the diplayed side in lr -> A
V.A = A;

% First Stage Choice Repition -> rep
rep = A(1,1:end-1) == A(1,2:end);
V.rep = rep;

% Transition: 1 for common | 0 for rare -> trans
V.trans = trans; 

% states -> S
V.S = S;

% Mind Wandering / Already Saved
%V.SelfStatement_reactionTime(nt)
%V.SelfStatement_choiceTime(nt)
%V.MindWanderingValue(nt)

V.payout = payout;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input

D.subjn = subjn;
D.session = session;

D.wintrial = wintrial;

tvns_run = tvns{subjn-100}(session);
D.tvns_run = tvns_run;

D.Ntrials = Z.Ntrials;
D.interval_sequence = Z.interval_sequence;
D.p = Z.p;

% Randomwalks
D.Randomwalks = randomwalks;
D.Walk = walks_condition(subjn-100, session);

% Other Experimental Parameters saved with Expparams script Z.
