%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize the Subject ID
subjn = -1; % Set to -1 initially to enter the loop

% Loop until a valid Subject ID is provided and confirmed
while subjn < 101 || subjn > 201
    % Ask the user for input
    subjn = input('Enter the subject ID (101-201): ');
    
    % Check if the entered value is within the valid range
    if subjn >= 101 && subjn <= 201
        % Ask for confirmation
        confirm = input(['You entered subject ID ', num2str(subjn), '. Is this correct? (Y/N): '], 's');
        
        % Convert the confirmation to uppercase for robustness
        confirm = upper(confirm);
        
        % Check if the user confirmed the input
        if confirm == 'Y'
            disp('Subject ID confirmed.');
        elseif confirm == 'N'
            % If the user did not confirm, reset subjn to -1 to repeat the loop
            subjn = -1;
            disp('Please re-enter the subject ID.');
        else
            % If the user entered an invalid confirmation response, repeat the loop
            disp('Invalid confirmation response. Please re-enter the subject ID.');
            subjn = -1;
        end
    else
        % If the entered value is outside the valid range, repeat the loop
        disp('Subject ID must be between 101 and 201. Please re-enter.');
    end
end

% Display the final confirmed Subject ID
disp(['Subject ID: ', num2str(subjn)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Question 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Initialize the parameter
session = -1; % Set to -1 initially to enter the loop
% Loop until a valid Experimental Session is provided and confirmed
while session < 1 || session > 4
    % Ask the user for input
    session = input('Which experimental run/session are you conducting(1-4)? \n1 -- First Session, First Run \n2 -- Frist Session, Second Run \n3 -- Second Session, Frist Run \n4 -- Second Session, Second Run  \n');
    
    % Check if the entered value is within the valid range
    if session >= 1 && session <= 4
        % Ask for confirmation
        confirm = input(['You stated that you are conducting run/session no. ', num2str(session), '. Is this correct? (Y/N): '], 's');
        
        % Convert the confirmation to uppercase for robustness
        confirm = upper(confirm);
        
        % Check if the user confirmed the input
        if confirm == 'Y'
            disp('Session and run confirmed.');
        elseif confirm == 'N'
            % If the user did not confirm, reset subjn to -1 to repeat the loop
            session = -1;
            disp('Please re-enter the number of the run/session.');
        else
            % If the user entered an invalid confirmation response, repeat the loop
            disp('Invalid confirmation response. Please re-enter the number of the run/session.');
            session = -1;
        end
    else
        % If the entered value is outside the valid range, repeat the loop
        disp('Run/Session number must be between 1 and 4. Please re-enter.');
    end
end

% Display the final confirmed Subject ID
disp(['Session number: ', num2str(session)]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set Parameters

% Training for First Experiment of First Session
if session == 1
    
    dotraining = 1;
    
% Very Short Training in Second Run of First Session
elseif session == 2
    
    dotraining = 0;
    second_run = 1;
    
else
    
    dotraining = 0;
    second_run = 0;
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load Stimuli for Experiment and Training due to SubjectID and
% ExperimentID

trainingset = TrainingSet{subjn-100}(session); % Training

trialset = StimuliSet{subjn-100}(session); % Experiment

wintrial = win{subjn-100}(session); % Win/No-Win or Loss/No-Loss
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Ask the user to input 'y' or 'n' to confirm tvns usage/no-usage
if tvns{subjn-100}(session)
    eventConfirmed = input(['According to the experimental plan for subject -', num2str(subjn), '- in session -', num2str(session), '-\nYou are conducting taVNS. \nIs that right?  \nEnter ''y'' to confirm or ''n'' to cancel: '], 's');
else
    eventConfirmed = input(['According to the experimental plan for subject -', num2str(subjn), '- in session -', num2str(session), '-\nYou are NOT conducting taVNS. \nIs that right?  \nEnter ''y'' to confirm or ''n'' to cancel: '], 's');
end

% Check if the input is valid ('y' or 'n')
while ~(strcmpi(eventConfirmed, 'y') || strcmpi(eventConfirmed, 'n'))
    fprintf('Invalid input! Please enter ''y'' or ''n''.\n');
    eventConfirmed = input('Enter ''y'' to confirm  or ''n'' to cancel: ', 's');
end

% Ask for confirmation about proceeding with the experiment
if strcmpi(eventConfirmed, 'y')
    fprintf('Parameters are confirmed and set. Proceeding with the experiment.\n');
else
    error('Experiment canceled by the user.');
end
