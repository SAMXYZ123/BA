function [l] = H0(x,D,Z,doprior)

% Fit dual-control model by Daw et al., 2011, Neuron, to data from the two-step task

% INPUT:
% x = initializer numbers for "real" parameter randomly drawn from a normal distribution with which the data will be simulated: randn(7,1); 
% D = contains a (action choice in each state) + r (reward yes/no) + s (transition type) 
% Z = a priori parameters vector
% doprior = TRUE/FALSE --> should bayesian a prior be included in ML
% estimation or not

% OUTPUT:
% l = negative maximum likelihood in total
% dl = negative maximum likelihood for each parameter

% D.J. Schad, July 2013  (given an example script by Q.Huys)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Include Prior into MLE, so estimate via MAP0
doprior=1;

% number of trials
nt = size(D.r,1);

% number of parameters
np = length(x);

% paramter derived from x 
bmbi   = x(1);% parameter indicating redundancy of choices/ how deterministic they are
bmbs   = x(2);
bmfi   = x(3);
bmfs   = x(4);

bmw    = x(5);
bmwi   = x(6);

b2    = exp(x(7));
alpha  = 1./(1+exp(-x(8:9))); % learning rate
lambda = 1./(1+exp(-x(10))); % eligibility parameter ([0,1]) --> short-term memory parameter; how fast fades a new information that does not correspond with prior learning within one stage and is addable to old knowledge; weights events/outcomes depending on how long ago they are in terms of influence
rep    = x(11)*eye(2); % 1 if same 1st stage choice, 0 if different one (eye is identity matrix)


% preallocate variables for MS estimation
l  = 0;
%dl = zeros(np,1);

% adds bayesian apriori if doprior=TRUE
if doprior
    l  = l  + ( -np/2*log(2*pi) -1/2*log(1/det(Z.nui)) -1/2*(x-Z.mu)'*Z.nui*(x-Z.mu) );
%    dl = dl + -Z.nui*(x-Z.mu);
end

% preallocate variables that will be created later on
Q1   = zeros(2,1);
Q2   = zeros(2,2);

n = zeros(2);

% variable to ensure beta is not causing enormously high values in equation
% (more or less random choice of 20)
betaMax = 20;

% loop through all trials
for t=1:nt
    
    
    a = D.a(t,:); % get actions of trial
    r = D.r(t); % get reward of trial
    s = D.s(t); % get transition of trial
    nT2Probe = D.nT2Probe(t);
    MW_Value = D.MW_Value(t);
    
    %------------------------------------------
    % 1st stage
    %------------------------------------------
    
    % infer transition probabilities into learning (the real ones)
    if n(1,2)+n(2,1) < n(1,1)+n(2,2) 
        Tr = .3+.4*eye(2);
    else
        Tr = .3+.4*(1-eye(2));
    end
    
    % pam = probability for choosing action a (second-stage) for the model-based system
    pam = betaMax*Q2; 
    pam = pam - ones(2,1)*max(pam);
    pam = exp(pam);
    pam = pam*diag(1./sum(pam));
    
    % model-based Q-values: Qd
    Qd  = (sum(pam.*Q2)*Tr)';
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Linear Model to Test Hypothesis
    bmb = exp(bmbi + bmbs * nT2Probe + bmw * MW_Value + bmwi * MW_Value * nT2Probe);
    bmf = exp(bmfi + bmfs * nT2Probe);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    % effective Q-values
    if t > 1
        Qeff = bmb * Qd + bmf * Q1 + rep(:,D.a(t-1,1));
    else
        Qeff = bmb * Qd + bmf * Q1;
    end
    
    % probabilities for 1st-stage actions
    lpa1 = Qeff;
    lpa1 = lpa1 - max(lpa1);
    lpa1 = lpa1 - log(sum(exp(lpa1)));
    l = l + lpa1(a(1)); % log probability for action
    pa1 = exp(lpa1);
        
    %------------------------------------------
    % 2nd stage
    %------------------------------------------
    
    if ~isnan(a(2))
    % probabilities for 2nd-stage actions
    lpa2 = b2*Q2(:,s); 
    lpa2 = lpa2 - max(lpa2);
    lpa2 = lpa2 - log(sum(exp(lpa2)));

    l = l + lpa2(a(2)); % log probability for action
    pa2 = exp(lpa2);
    
    
    %--------------------------------------------
    % compute prediction error + update Q-values
    %--------------------------------------------
    
    
    % prediction error of each state
    rpe1 = Q2(a(2),s) - Q1(a(1));
    rpe2 = r - Q2(a(2),s);
    
    
    
    % new Q values for the net trial (at the beginning always 0, as there
    % is nothing to expect jet)
    Q1(a(1))   = Q1(a(1))   + alpha(1)*(rpe1 + lambda*rpe2);
    
    Q2(a(2),s) = Q2(a(2),s) + alpha(2)* rpe2;
    end
    
    % update transition count
    n(a(1),s) = n(a(1),s)+1; 
    
end

% Output of ML estimation
l = -l;
%dl = -dl;

