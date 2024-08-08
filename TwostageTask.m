%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Maximum Likelihood estimation per subject %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clear workspace
%clear;
%Load Data
load('Data.mat')

% add functions
addpath('Functions/');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% number of variables
nv = 9;

% number of subjects
Nsbj = 41;

% number of samples for Likelihood sampling
Nsamples = 2000;

% initialize x for parameter distribution
x = randn(nv,1) * 0.1; %Initialiize with small number

%
doprior = 1; %Anyway defined in function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % simulate data (for a single subject)
% %-----------------
% x = randn(7,1); % initializer numbers for "real" parameter randomly drawn from a normal distribution with which the data will be simulated
% nt = 201; % number of simulated trials
% tLR = false;
% [a, r, s, trans] = genm2b2alr(x, nt, tLR); % function to simulate data



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Z = []; % a priori parameters vector
% Define prior mean
Z.mu = zeros(nv, 1); % Assuming the prior mean for all parameters is 0 // influences significance
% Define prior covariance matrix (or precision matrix)
% For simplicity, let's assume an identity covariance matrix, meaning no prior covariance among parameters
sigma = eye(nv) * 25; % => Std=5; % Identity matrix of size 8x8
% Calculate the precision matrix (inverse of the covariance matrix)
Z.nui = inv(sigma); % Precision matrix // 95% zwischen -2 und +2 variieren 



for PPP = 1:Nsbj
    
  disp(['Estimation for Subject ' num2str(PPP)]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load data
D(PPP).a = Data(PPP).A'; % action choice in each state
D(PPP).r = Data(PPP).R'; % reward yes/no
D(PPP).s = Data(PPP).S(2,:)'-1; % transition (in terms of common for action 1 or 2)
D(PPP).nT2Probe = Data(PPP).nT2Probe';

nt(PPP) = Data(PPP).Nch';
 
% find the likelihood of the data given the parameters for a given set of
% parameter values
%-----------------

%[l, dl] = H0(x, D, Z, doprior); % get l,dl
[l] = H0(x, D(PPP), Z, doprior); % get l,dl


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% do maximum likelihood estimation for a single subject
%-----------------
% fminuc minimizes a function (here maximum likelihood function) 
%init = randn(nv,1) * 0.1; % random starting point of minimazation  // kleinere Std
init = ones(nv,1) * 0.1;
fminopt = optimset('display','off', 'GradObj','off'); % optimset defines options for optimazation; function option here = no output on display
% Options Grad obj on
                


[est,fval,ex,foo,grad,hess] = fminunc(@(x)H0(x,D(PPP),Z,doprior),init,fminopt);

% est: Maximum Likelihood (ML) estimation for one person's parameter
% fval: negative likelihood value for the ML estimations
% ex: describes the exit condition of fminunc
% foo: structure containing information about the optimization process
% grad: gradient of fun at the solution x
% hess: Hessian matrix = matrix of the 2. deductions of the Likleihood against the parameter at optimum (i.e. for the ML estimation)

Results(PPP).est = est;        % Maximum Likelihood estimation for parameters
Results(PPP).fval = fval;      % Negative log-likelihood value
Results(PPP).ex = ex;          % Exit condition of fminunc
Results(PPP).foo = foo;        % Information about the optimization process
Results(PPP).grad = grad;      % Gradient of the function at the solution
Results(PPP).hess = hess;      % Hessian matrix at the solution

Hess(:,:,PPP) = hess;

%Parameter simply in a better format
Parameter_PP(:,PPP) = est;

% compute SE for each Parameter of each Subject
SE_Param(:,PPP) = sqrt(diag(inv(hess))); % erst diag dann inv schauen ob was anderes raus kommt

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(['Run T-Tests ']);
% t test statistics
for UUU = 1:nv
[h,p,ci,stats] = ttest(Parameter_PP(UUU,:));
Tstats.H(UUU,:) = h;
Tstats.P(UUU,:) = p;
Tstats.CI(UUU,:)= ci;
Tstats.STATS(UUU) = stats;
end


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter Mean
 Parameter_Mean = mean(Parameter_PP,2);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(['Compute BIC and iBIC']);
% compute likelihood per sample

Mean_Hess = mean(Hess,3);
samples = Parameter_Mean + randn(nv,Nsamples) .* diag(inv(Mean_Hess)); %std(Parameter_PP,0,2); % create distribution of Params with Mu=Parameter_Mean and STD(Parameters) of estimation // nicht entscheident

for JJJ=1:Nsbj % Loop over Subjects
    
    disp(['Sampling Subject ' num2str(JJJ)]);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Compute BIC
    BIC(JJJ) = -2 * (-Results(JJJ).fval) + nv * log(nt(JJJ)); % BIC formula: BIC = -2 * log(L) + k * log(n) // Als --> std diag(inv(hess)) // nu anschauen
    Results(JJJ).BIC = BIC(JJJ); % Store BIC in Results
    % BIC für H0 and H1 berechnen und dann paired T-Test


    for FFF = 1:Nsamples % Loop over Samples
        LLi(FFF,JJJ)= H0(samples(:,FFF), D(JJJ), Z, 0); % obtain log likelihood from distribution of estimated parameters
    end

    lpk0 = max(-LLi(:,JJJ)); % max likelihood of all samples
    pk0 = exp(-LLi(:,JJJ)-lpk0); % normalized likelihood
    iL(JJJ) = log(mean(exp(-LLi(:,JJJ)-lpk0)))+lpk0; % integrated likelihood 
end

% Compute IBIC
iBIC =  -2 * (sum(iL) - 1/2 * (2 * nv + 0)*log(sum(nt))); % 0 for Nreg ask Daniel -> 0 is ok


% save everthing
save('H0_Fit.mat', 'Parameter_PP', 'Parameter_Mean', 'Tstats', 'BIC', 'iBIC', 'Results' );
