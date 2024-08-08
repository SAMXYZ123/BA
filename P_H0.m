load H0_Fit % load parameter estimates
load Data % load choices

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
%doprior=1;


for p=1:numel(Data) % Loop over Subjects
% number of trials
nt(p) = Data(p).Nch;

% number of parameters
np = length(Parameter_Mean);

% paramter derived from x 
bmbi   = Parameter_PP(1,p); % Take each parameter of estimates of a person
bmbs   = Parameter_PP(2,p);
bmfi   = Parameter_PP(3,p);
bmfs   = Parameter_PP(4,p);
b2    = exp(Parameter_PP(5,p));
alpha  = 1./(1+exp(-Parameter_PP(6:7,p))); % learning rate
lambda = 1./(1+exp(-Parameter_PP(8,p))); % eligibility parameter ([0,1]) --> short-term memory parameter; how fast fades a new information that does not correspond with prior learning within one stage and is addable to old knowledge; weights events/outcomes depending on how long ago they are in terms of influence
rep    = Parameter_PP(9,p)*eye(2); % 1 if same 1st stage choice, 0 if different one (eye is identity matrix)

% preallocate variables for MS estimation
l  = 0;


% preallocate variables that will be created later on
Q1   = zeros(2,1);
Q2   = zeros(2,2);

n = zeros(2);

% variable to ensure beta is not causing enormously high values in equation
% (more or less random choice of 20)
betaMax = 20;

% loop through all trials
for t=1:nt(p) % Loop over choices of each subject
    
    
    a = Data(p).A(:,t); % get actions of trial
    r = Data(p).R(t); % get reward of trial
    s = Data(p).S(2,t)-1; % get transition of trial
    nT2Probe = Data(p).nT2Probe(t);
    
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
    bmb = exp(bmbi + bmbs * nT2Probe);
    bmf = exp(bmfi + bmfs * nT2Probe);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    % effective Q-values
    if t > 1
        Qeff = bmb * Qd + bmf * Q1 + rep(:,Data(p).A(1,t-1));
    else
        Qeff = bmb * Qd + bmf * Q1;
    end
    
    % probabilities for 1st-stage actions
    lpa1 = Qeff;
    lpa1 = lpa1 - max(lpa1);
    lpa1 = lpa1 - log(sum(exp(lpa1)));
    l = l + lpa1(a(1)); % log probability for action
    pa1 = exp(lpa1);
    modelprob_1(p,t) = pa1(a(1)); % save and store first step choice probability per trial and subject
        
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
    modelprob_2(p,t) = pa2(a(2)); % save and store second step choice probability per trial and subject
    
    
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
end


% Choice Probability Coputations


% concatonate probs in one line in order to compute product 
modelprob_1_shape = reshape(modelprob_1', 1, []);
modelprob_2_shape = reshape(modelprob_2', 1, []);

% remove zeros that arise due to matrix structure
no_zeros_1 = ~ismember(modelprob_1_shape, 0);
modelprob_1_concat = modelprob_1_shape(no_zeros_1);

no_zeros_2 = ~ismember(modelprob_2_shape, 0);
modelprob_2_concat = modelprob_2_shape(no_zeros_2);

% Instead of multiplying the probabilities calculate sum of log(p)
% because Matlab cannot deal with numbers lower than e-324
modelprob_1_prod = sum(log(modelprob_1_concat));
modelprob_2_prod = sum(log(modelprob_2_concat));
modelprob_all_prod = sum(log([modelprob_1_concat modelprob_2_concat]));


% Probability for choices given Model estimates
% Same reason: Instead of power to the given term multiply by it and then
% exp(p)
Prob_Model_Choice_1 = exp(modelprob_1_prod * (1/sum(nt)))
Prob_Model_Choice_2 = exp(modelprob_2_prod * (1/sum(nt)))
Prob_Model_Choice_all = exp(modelprob_all_prod * (1/(2*sum(nt))))

save('Choice_Prob_H0.mat', 'Prob_Model_Choice_1', 'Prob_Model_Choice_2', 'Prob_Model_Choice_all');
