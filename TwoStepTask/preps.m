%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

aborted=0; % if this parameter is set to one, things will abort. 

% make sure we use different random numbers
rand('twister',sum(1000*clock));

%....................... Saving

namestring_short = ['TS_' num2str(subjn) '_' num2str(session) ];                                % simplified name string
namestring_long  = ['TS_' num2str(subjn) '_' num2str(session) '_' datestr(now,'_yymmdd_HHMM')]; % detailed name string

if dotraining;
	namestring_long	= [namestring_long  '_training'];
	namestring_short	= [namestring_short '_training'];
end

if exist('data')~=7; eval(['!mkdir data']); end % make 'data' folder if dosn't exist

if dosave 
	fprintf('............ Data will be saved as                              \n');
	fprintf('............ %s and %s \n', namestring_long, namestring_short);
	fprintf('............ in the folder ''data''\n');
end


if dotraining | second_run
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% RANDOMWALKS %%%%%%%%%%%%%%%%%%%%%%%%%%
%......................... generate NEW random walks EVERYTIME!
dsigma=0.03;
randomwalks=.25+.5*rand(4,1);
for t=2:Z.Ntrials
	tmp = randomwalks(:,t-1)+dsigma*randn(4,1);
	i=tmp<.25; tmp(i) =  .5-tmp(i);
	i=tmp>.75; tmp(i) = 1.5-tmp(i);
	randomwalks(:,t)=tmp;
end

% plot(randomwalks') %Plot Walks to check if it works
%Adjust Walk structure to necessary parameters in the experiment from 4x1
%to 2x2x1
randomwalk_ADJ=zeros(2,2,Z.Ntrials);

randomwalk_ADJ(1,1,:)=randomwalks(1,:);
randomwalk_ADJ(1,2,:)=randomwalks(2,:);
randomwalk_ADJ(2,1,:)=randomwalks(3,:);
randomwalk_ADJ(2,2,:)=randomwalks(4,:);

randomwalks = randomwalk_ADJ;


else
    load(strcat('randomwalks_', num2str(walks_condition(subjn-100, session))));
    % randomwalks(second step state, chosen stimuli, trial)
end

    
% translate probabilities into rewards
rewprob = rand(2,2,length(randomwalks))<randomwalks;
%rewprob(second step state, chosen stimuli, trial)


    


%% Plot Again to Check again!
% t = 1:size(randomwalk_ADJ, 3);
% figure;
% hold on;
% 
% plot(t, squeeze(randomwalk_ADJ(1, 1, :)), 'b', 'DisplayName', 'randomwalk_ADJ(1, 1)');
% plot(t, squeeze(randomwalk_ADJ(1, 2, :)), 'r', 'DisplayName', 'randomwalk_ADJ(1, 2)');
% plot(t, squeeze(randomwalk_ADJ(2, 1, :)), 'g', 'DisplayName', 'randomwalk_ADJ(2, 1)');
% plot(t, squeeze(randomwalk_ADJ(2, 2, :)), 'm', 'DisplayName', 'randomwalk_ADJ(2, 2)');
% 
% hold off;
% xlabel('Time (t)');
% ylabel('Value');
% title('randomwalk_ADJ');
% legend('Location', 'best');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% COMMENT OUT OLD STUF F%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %......................... load random walks from Daw et al. 2011 
% if dotraining
%    load ('randomwalk_1st_8.mat'); 
%    rewprob = rand(2,2,length(randomwalk_1st_8))<randomwalk_1st_8;	% draw random bits 
%    load ('dawtrainingrandomwalks.mat'); 
%    rewprob(:,:,9:58) = rand(2,2,length(dawtrainingrandomwalks))<dawtrainingrandomwalks;	% draw random bits    
% else
% 	load ('dawrandomwalks.mat'); 
% 	rewprob = rand(2,2,length(dawrandomwalks))<dawrandomwalks;	% draw random bits 
% end

%%%%%%%%%%%%%%%%%%%%%%%%% PLOT FOR THE RANDOM WALKS
%%%%%%%%%%%%%%%%%%%%%%%%% COPY INTO NEW SKRIPT TO SEE PLOT
% dawone = dawrandomwalks(1,1,:);
% dawtwo = dawrandomwalks(1,2,:);
% dawthree = dawrandomwalks(2,1,:);
% dawfour = dawrandomwalks(2,2,:);
% 
% % Plot the random walks
% figure;
% plot(dawone(:,:), 'r');
% hold on;
% plot(dawtwo(:, :), 'y');
% plot(dawthree(:, :), 'b');
% plot(dawfour(:, :), 'c');
% hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%......................... pre-assign some variables 
lr = (rand(3,Z.Ntrials)>0.5)+1;			        % left or right 

trans = rand(1,Z.Ntrials)<Z.p; 			        % noise for transition from state 1 to state 2 for experimental trials

% sequence for trials in instructions (1:8)
if dotraining;
	trans(1:(nt0-1))     = [1 1 1 1 1 1 1 1]; %original: [1 1 0 1 1 1 1 0] --> CHANGE to deterministic transition for Instructions
	trans(nt0:end) = rand(1,Z.Ntrials-8)<Z.p; 
end 
S = [ones(1,Z.Ntrials); zeros(1,Z.Ntrials)];    % state sequence


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create Sequence for Mind Wandering Query 
%--> HARD CODED AND NOT SIMPLY CHANGLABLE
input_intervals = [11:15 11:15]; %1:11 twice => 10 MW probes

input_intervals = input_intervals(randperm(length(input_intervals))); % random order of intervals
cum_input = cumsum(input_intervals); % cumulativ sum for transformation

interval_sequence = zeros(1,max(cum_input)); % zeros to prepare for loop

for k = 1:length(input_intervals)
    interval_sequence(cum_input(k))=1; %turn interval into sequence of 1 and 0
end

interval_sequence = [interval_sequence zeros(1,4)]; %add last four 0 to array for completion
Z.interval_sequence = interval_sequence;

LR_short = [zeros(1,5), ones(1,5)]; % zeros and ones for which side
LR_short = LR_short(randperm(length(LR_short))); %random order

anker_LR = zeros(size(interval_sequence)); %zeros as baseline
which_indices = find(interval_sequence==1); %find indices of when Query happens
anker_LR(which_indices) = LR_short; %replace zeros in those indices with LR value
anker_LR = [anker_LR 0 0 0 0]; % fill to 134 trials



%empty vectors: 
R = zeros(1,Z.Ntrials);  
Prob = zeros(1,Z.Ntrials);  
G = zeros(1,Z.Ntrials);                               
RT = zeros(2,Z.Ntrials);                     
onset_trial = zeros(2,Z.Ntrials);
onset_dec   = zeros(2,Z.Ntrials);
onset_dec_mem = zeros(2,Z.Ntrials);
onset_feedback = zeros(1,Z.Ntrials);    
onset_missing_sign = zeros(2,Z.Ntrials);

wall= zeros(200,1);
