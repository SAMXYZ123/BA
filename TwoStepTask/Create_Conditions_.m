%%Create Main-Conditions Win/Loss and tvns
conditionI = {[1 0 1 0]; [1 1 0 0]};
conditionII = {[0 1 0 1]; [1 1 0 0]};
conditionIII = {[1 0 1 0]; [0 0 1 1]};
conditionIIII = {[0 1 0 1]; [0 0 1 1]};


conditions = perms([1,2,3,4])'; % all possible permutations
index = randperm(24); % index for random order of permutations

% random order but all main-conditions occur every 4 subjects
conditions = conditions(:,index) ;
condtions = reshape(conditions, 1, []);

% Replace entries with corresponding conditions
conditionsCell = cell(1, numel(conditions));
for i = 1:numel(conditions)
    switch conditions(i)
        case 1
            conditionsCell{i} = conditionI;
        case 2
            conditionsCell{i} = conditionII;
        case 3
            conditionsCell{i} = conditionIII;
        case 4
            conditionsCell{i} = conditionIIII;
    end
   
   % add random permutation of Stimuli for Exp and Training // not fully balanced! 
   conditionsCell{i}{3} = randperm(4); % for Exp Stimuli
   conditionsCell{i}{4} = [randperm(2) 1 1]; % for Training Stimuli
   
end


% Split Vector to use in automaticparameters script
win = cellfun(@(x) x(1,:), conditionsCell);
tvns = cellfun(@(x) x(2,:), conditionsCell);
StimuliSet = cellfun(@(x) x(3,:), conditionsCell);
TrainingSet = cellfun(@(x) x(4,:), conditionsCell);

% create conditions for random walks 
for k = 1:96
    walks_condition(k,:) = randperm(4);
end

clear k

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%% Test Conditions
% test = [win; tvns];
% 
% % Initialize the counter.
% Main_count(1:4,1) = 0;
% 
% % Loop through the elements of test and compare them to conditions
% for i = 1:(numel(test)/2)
%     if isequal(test(1:2,i), conditionI) % Testing for Condition1
%         Main_count(1,1) = Main_count(1,1) + 1;
%     
%     
%     elseif isequal(test(1:2,i), conditionII) % Testing for Condition2
%         Main_count(2,1) = Main_count(2,1) + 1;
%     
%     
%     elseif isequal(test(1:2,i), conditionIII) % Testing for Condition3
%         Main_count(3,1) = Main_count(3,1) + 1;
%     
%     
%     elseif isequal(test(1:2,i), conditionIIII) % Testing for Condition4
%         Main_count(4,1) = Main_count(4,1) + 1;
%     end
% end
% 
% 
% % Testing Traing Stimuli occurences compares to all pemutation of 1:4
% countT(1:24)=0;
% T_all_perms = perms(1:4)   ;
% % Loop through the elements of test and compare them to conditions
% for k = 1:24
%     for l = 1:(numel(test)/2)
%         if isequal({T_all_perms(k,:)}, TrainingSet(1,l)) % change condition to count other ones
%             countT(k) = countT(k) + 1;
%         end
%     end
% end
% 
% % Testing Experimental Stimuli occurences compares to all pemutation of 1:4
% countS(1:24)=0;
% S_all_perms = perms(1:4)   ;
% for k = 1:24
%     for l = 1:(numel(test)/2)
%         if isequal({S_all_perms(k,:)}, StimuliSet(1,l)) % change condition to count other ones
%             countS(k) = countS(k) + 1;
%         end
%     end
% end
% T_all_perms(:,5) = countT; % for Training // Occurences in column 5
% S_all_perms(:,5) = countS; % for Experiment // Occurences in column 5
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% % To save all conditions in a file 
% %// Do not Use While Trials are Ongoing! 
% %// Uncomment to create new File 
%%%save("Exp_Conditions.mat", 'win', 'tvns', 'StimuliSet', 'TrainingSet', 'walks_condition')  


%%%%%%%%%%%%%%%%%%
%%%% Create CSV for Laboratory File
% 

% for k=1:96
%    
%    tvnsSess(k,1) = tvns{k}(1)&tvns{k}(2);
%    
%    tvnsSess(k,2) = tvns{k}(3)&tvns{k}(4);
%    
%    for j=1:2
%         if tvnsSess(k,j) == 1
%             Stimulus(k,j) = {'tVNS'};
%         else
%             Stimulus(k,j) = {'sham'};
%         end
%    end
%     
%    
%    for i=1:4
%        
%        Xversion(k,i) = win{k}(i)
%        
%         if Xversion(k,i) == 1
%                version(k,i) = {'win/no-winn'}
%         elseif Xversion(k,i) == 0
%                version(k,i) = {'loss/no-loss'}
%         end
%         
%     end
%    
%       
% end
% 
% T = table(Stimulus(1:96,1), Stimulus(1:96,2), version(1:96,1), version(1:96,2), version(1:96,3), version(1:96,4), 'VariableNames', {'1. Session Stimulation', '2. Session Stimulation', '1. Run Version', '2. Run Version', '3. Run Version', '4. Run Version'});

%writetable(T, 'StimType.csv');
