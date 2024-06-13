%%%%%%%%%%%%%%%%% Open Conditions and save them for Laboratory Sheet
load Exp_Conditions



for k=1:96
   
   tvnsSess(k,1) = tvns{k}(1)&tvns{k}(2);
   
   tvnsSess(k,2) = tvns{k}(3)&tvns{k}(4);
   
   for j=1:2
        if tvnsSess(k,j) == 1
            Stimulus(k,j) = {'tVNS'};
        else
            Stimulus(k,j) = {'sham'};
        end
   end
    
   
   for i=1:4
       
       Xversion(k,i) = win{k}(i);
       
        if Xversion(k,i) == 1
               version(k,i) = {'win/no-winn'};
        elseif Xversion(k,i) == 0
               version(k,i) = {'loss/no-loss'};
        end
        
    end
   
      
end

T = table(Stimulus(1:96,1), Stimulus(1:96,2), version(1:96,1), version(1:96,2), version(1:96,3), version(1:96,4), 'VariableNames', {'1. Session Stimulation', '2. Session Stimulation', '1. Run Version', '2. Run Version', '3. Run Version', '4. Run Version'});

writetable(T, 'StimType.csv');