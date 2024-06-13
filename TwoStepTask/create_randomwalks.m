%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% RANDOMWALKS %%%%%%%%%%%%%%%%%%%%%%%%%%
%......................... generate NEW random walks EVERYTIME!
% Z.Ntrials=134
% 
% 
% dsigma=0.025;
% randomwalks=.25+.5*rand(4,1);
% for t=2:Z.Ntrials
% 	tmp = randomwalks(:,t-1)+dsigma*randn(4,1);
% 	i=tmp<.25; tmp(i) =  .5-tmp(i);
% 	i=tmp>.75; tmp(i) = 1.5-tmp(i);
% 	randomwalks(:,t)=tmp;
% end
% 
% 
% %Adjust Walk structure to necessary parameters in the experiment from 4x1
% %to 2x2x1
% randomwalk_ADJ=zeros(2,2,Z.Ntrials);
% 
% randomwalk_ADJ(1,1,:)=randomwalks(1,:);
% randomwalk_ADJ(1,2,:)=randomwalks(2,:);
% randomwalk_ADJ(2,1,:)=randomwalks(3,:);
% randomwalk_ADJ(2,2,:)=randomwalks(4,:);
% 
% randomwalks = randomwalk_ADJ;

% rewprob = rand(2,2,length(randomwalks))<randomwalks;


load randomwalks_4

% Plot Again to Check again!
t = 1:size(randomwalks, 3);
figure;
hold on;

plot(t, squeeze(randomwalks(1, 1, :)), 'b', 'DisplayName', 'randomwalk_ADJ(1, 1)');
plot(t, squeeze(randomwalks(1, 2, :)), 'r', 'DisplayName', 'randomwalk_ADJ(1, 2)');
plot(t, squeeze(randomwalks(2, 1, :)), 'g', 'DisplayName', 'randomwalk_ADJ(2, 1)');
plot(t, squeeze(randomwalks(2, 2, :)), 'm', 'DisplayName', 'randomwalk_ADJ(2, 2)');

hold off;
xlabel('Time (t)');
ylabel('Value');
title('randomwalk_ADJ');
legend('Location', 'best');



%save ('randomwalks_4.mat', 'randomwalks')