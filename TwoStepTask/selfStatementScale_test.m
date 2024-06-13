 % Clear the workspace and close any existing Psychtoolbox windows
    sca;
    close all;

    % Set up Psychtoolbox
    PsychDefaultSetup(2);
    Screen('Preference', 'SkipSyncTests', 2);
    screenNumber = max(Screen('Screens'));
    [window, windowRect] = PsychImaging('OpenWindow', screenNumber, 1);
    [screenXpixels, screenYpixels] = Screen('WindowSize', window);
    Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
    
    % Colors
    black = [0, 0, 0]; % Color of the bar
    white = [250, 250, 250]; % Set white color
    scaleColor = [150, 150, 150]

    % Define the scale properties
    scaleWidth = 0.7 * screenYpixels;
    scaleHeight = 0.005 * screenXpixels;
    scaleXPos = screenXpixels / 2;
    scaleYPos = screenYpixels / 2;
    frameWidth = 2; % Frame width
    barWidth = 0.5;

    scaleRect = [scaleXPos - scaleWidth/2, scaleYPos - scaleHeight/2, scaleXPos + scaleWidth/2, scaleYPos + scaleHeight/2]; % Input rect
    frameRect = [scaleRect(1) - frameWidth, scaleRect(2) - frameWidth, scaleRect(3) + frameWidth, scaleRect(4) + frameWidth]; % Input Frame

    % TEXT for Questions and Ankers 
    question = 'In the moment prior to the probe, was your attention focused: ... ';
    anker_text_l = 'completely on \nthe task';
    anker_text_r = 'completely on \nunrelated concerns';

    % Calculate the position to center the text on the x-axis
    questRect = Screen('TextBounds', window, question);
    questWidth = questRect(3) - questRect(1);
    questXPos = (screenXpixels - questWidth) / 2;
    questYPos = screenYpixels / 4;  % Adjust the vertical position as desired

    anker_text_l_rect = Screen('TextBounds', window, anker_text_l);
    anker_text_l_width = anker_text_l_rect(3) - anker_text_l_rect(1);
    
    anker_text_r_rect = Screen('TextBounds', window, anker_text_r);
    anker_text_r_width = anker_text_r_rect(3) - anker_text_r_rect(1);

    % Define the bar properties
    barHeight = scaleHeight * 3; % Adjust the height of the bar as desired

    % Calculate the y-position of the bars
    barYPos = scaleYPos - barHeight/2;

    % Calculate the x-positions for the bars
    barXPosStart = scaleXPos - scaleWidth / 2 + barWidth;
    barXPosEnd = scaleXPos + scaleWidth / 2 - barWidth;
    barXPosQuarter1 = scaleXPos - scaleWidth / 4 + barWidth;
    barXPosQuarter3 = scaleXPos + scaleWidth / 4 - barWidth;
    barXPosMiddle = scaleXPos;
    
    % Time Limit to make a decision
    decisionTimeLimit = 20;
    warningTime = 10;

    % Set the mouse cursor to the middle of the screen
    SetMouse(scaleXPos, scaleYPos, window);
    
    % Hide the cursor
    HideCursor(window);

    % Set the color and size of the custom cursor shape
    cursorColor = white;  % Red color
    cursorFrameColor = black;   % Blue color for the cursor frame
    cursorSize = 10;            % Size of the cursor shape

    % Start the main loop
    startTime = GetSecs; % Get the start time
    mouseMoved = false; % Flag to track mouse movement
    KbName('UnifyKeyNames');
    escapeKey = KbName('Escape');

    while 1
        % Draw Text
        DrawFormattedText(window, question, questXPos, questYPos, [0, 0, 0, 1]); % draw Question
        DrawFormattedText(window, anker_text_l, (scaleXPos - scaleWidth), scaleYPos, [0, 0, 0, 1]); % draw Anker
        DrawFormattedText(window, anker_text_r, (scaleXPos + scaleWidth - anker_text_r_width/2), scaleYPos, [0, 0, 0, 1]); % draw Anker
        
        % Draw the scale
        Screen('FillRect', window, scaleColor, scaleRect);

        % Draw the frame around the scale
        Screen('FrameRect', window, black, frameRect, frameWidth);
        
        % Get the current mouse position
        [mx, my, buttons] = GetMouse(window);

        % Change color of scale according to movement of the mouse
        scaleColor = [0.9, 0.9, 0.9] - 0.2 * (abs((mx - scaleXPos) / (scaleWidth / 2)));
        
        % Draw the custom cursor shape at the mouse position
        Screen('FillOval', window, cursorColor, [mx - cursorSize, my - cursorSize, mx + cursorSize, my + cursorSize]);
        
        % Draw the custom cursor frame at the mouse position
        Screen('FrameOval', window, cursorFrameColor, [mx - cursorSize - 2, my - cursorSize - 2, mx + cursorSize + 2, my + cursorSize + 2], 3);
        
        
        % Check if the mouse cursor is outside the restricted region
        if mx < scaleRect(1) || mx > scaleRect(3) || my < scaleYPos || my > scaleYPos
            % Bring the mouse cursor back within the restricted region
            mx = max(scaleRect(1), min(scaleRect(3), mx));
            my = scaleYPos;
            
            % Set the corrected cursor position
            SetMouse(mx, my, window);
        end
        
        % Check for mouse movement
        if ~mouseMoved && any([mx, my] ~= [scaleXPos, scaleYPos])
            mouseMoved = true;
            reactionTime = GetSecs - startTime; % Update the start time
        end

        % Check for mouse click and break the loop if clicked
        if any(buttons)
            break;
        end

        % Check for escape key press and break the loop if pressed
        [~, ~, keyCode] = KbCheck;
        if keyCode(escapeKey)
            break;
        end
        
        % Draw the bars
        Screen('FillRect', window, black, [barXPosStart - (barWidth * 2), barYPos, barXPosStart + (barWidth * 2), barYPos + barHeight]);
        %Screen('FillRect', window, black, [barXPosQuarter1 - barWidth, barYPos, barXPosQuarter1 + barWidth, barYPos + barHeight]);
        Screen('FillRect', window, black, [barXPosMiddle - (barWidth * 2), barYPos, barXPosMiddle + (barWidth * 2), barYPos + barHeight]);
        %Screen('FillRect', window, black, [barXPosQuarter3 - barWidth, barYPos, barXPosQuarter3 + barWidth, barYPos + barHeight]);
        Screen('FillRect', window, black, [barXPosEnd - (barWidth * 2), barYPos, barXPosEnd + (barWidth * 2), barYPos + barHeight]);

        % Flip the window to display the updated screen
        Screen('Flip', window);
        
        % Warning for Subject taking too much time
        elapsedTime = GetSecs - startTime;
        if elapsedTime > warningTime
            DrawFormattedText(window, 'decide now!', 'center', (screenYpixels/1.4), [255, 0, 0, 1]);
        end
        
        
         % Check if the decision time limit has been reached
        elapsedTime = GetSecs - startTime;
        if elapsedTime > decisionTimeLimit
            break;
        end

    end
    
    % Set Values to X if no reaction
    if elapsedTime > decisionTimeLimit
            reactionTime = NaN;
            choiceTime = NaN;
            selfStatementValue = NaN;
    else
         % Calculate the Choice time
    choiceTime = GetSecs - startTime ;   

    % Get the self-statement value from the mouse position
    selfStatementValue = (mx - scaleXPos) / (scaleWidth / 2);        
    end

    % Print the self-statement value
    disp(['Self-statement value: ', num2str(selfStatementValue)]);
    % Print reaction time
    disp(['Reaction time: ', num2str(reactionTime)]);
    % Print choice time
    disp(['Choice time: ', num2str(choiceTime)]);

    % Close the window and clear the screen
    sca;
