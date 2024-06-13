    fprintf('............. Mind Wondering Query %i / %d\n',nt, Z.Ntrials);
    
    SetMouse(scaleXPos, scaleYPos, wd); % Set the mouse cursor to the middle of the screen

    % Start the main loop
    startTime = GetSecs; % Get the start time
    mouseMoved = false; % Flag to track mouse movement
    KbName('UnifyKeyNames');
    escapeKey = KbName('Escape');
    
    %Anker Sides for Instruktion
    if instr_steps;
    anker_LR(1:4) = [1 0 1 0];
    end

    while 1
        
        % Draw Text
        DrawFormattedText(wd, question, questXPos, questYPos, hard_white); % draw Question
        
        if anker_LR(nt) % Which side for Ankers
            DrawFormattedText(wd, anker_text_A, (scaleXPos - (scaleWidth/2) - anker_text_A_width - 0.05*wdw), scaleYPos, hard_white); % draw Anker
            DrawFormattedText(wd, anker_text_B, (scaleXPos + (scaleWidth/2) + 0.05*wdw), scaleYPos, hard_white); % draw Anker
        else
            DrawFormattedText(wd, anker_text_B, (scaleXPos - (scaleWidth/2) - anker_text_B_width - 0.05*wdw), scaleYPos, hard_white); % draw Anker
            DrawFormattedText(wd, anker_text_A, (scaleXPos + (scaleWidth/2) + 0.05*wdw), scaleYPos, hard_white); % draw Anker
        end
        
        
        % Draw the scale
        Screen('FillRect', wd, scaleColor, scaleRect);

        % Draw the frame around the scale
        Screen('FrameRect', wd, black, frameRect, frameWidth);
        
        % Get the current mouse position
        [mx, my, buttons] = GetMouse(wd);

        % Change color of scale according to movement of the mouse
        scaleColor = [100, 100, 100] + 90 * (abs((mx - scaleXPos) / (scaleWidth / 2)));
        
        % Draw the custom cursor shape at the mouse position
        Screen('FillOval', wd, cursorColor, [mx - cursorSize, my - cursorSize, mx + cursorSize, my + cursorSize]);
        
        % Draw the custom cursor frame at the mouse position
        Screen('FrameOval', wd, cursorFrameColor, [mx - cursorSize - 2, my - cursorSize - 2, mx + cursorSize + 2, my + cursorSize + 2], 3);
        
        
        % Check if the mouse cursor is outside the restricted region
        if mx < scaleRect(1) || mx > scaleRect(3) || my < scaleYPos || my > scaleYPos
            % Bring the mouse cursor back within the restricted region
            mx = max(scaleRect(1), min(scaleRect(3), mx));
            my = scaleYPos;
            
            % Set the corrected cursor position
            SetMouse(mx, my, wd);
        end
        
        % Check for mouse movement
        if ~mouseMoved && any([mx, my] ~= [scaleXPos, scaleYPos])
            mouseMoved = true;
            V.SelfStatement_reactionTime(nt) = GetSecs - startTime; % Update the start time
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
        Screen('FillRect', wd, white, [barXPosStart - (barWidth * 2), barYPos, barXPosStart + (barWidth * 2), barYPos + barHeight]);
        %Screen('FillRect', wd, black, [barXPosQuarter1 - barWidth, barYPos, barXPosQuarter1 + barWidth, barYPos + barHeight]);
        Screen('FillRect', wd, white, [barXPosMiddle - (barWidth * 2), barYPos, barXPosMiddle + (barWidth * 2), barYPos + barHeight]);
        %Screen('FillRect', wd, black, [barXPosQuarter3 - barWidth, barYPos, barXPosQuarter3 + barWidth, barYPos + barHeight]);
        Screen('FillRect', wd, white, [barXPosEnd - (barWidth * 2), barYPos, barXPosEnd + (barWidth * 2), barYPos + barHeight]);

        % Flip the window to display the updated screen
        Screen('Flip', wd);
        
        % Warning for Subject taking too much time
        elapsedTime = GetSecs - startTime;
        if elapsedTime > Z.SelfStatement_warningTime
            DrawFormattedText(wd, Z.text_fb_too_slow, 'center', (wdh/1.4), red);
        end
        
        
         % Check if the decision time limit has been reached
        elapsedTime = GetSecs - startTime;
        if elapsedTime > Z.SelfStatement_TimeLimit
            break;
        end
        
        checkabort;

    end
    
    
    
    
if elapsedTime > Z.SelfStatement_TimeLimit  % Set Values to X if no reaction
          
    V.SelfStatement_reactionTime(nt) = NaN;
    V.SelfStatement_choiceTime(nt) = NaN;
    V.MindWanderingValue(nt) = NaN;
    
else % Calculate the Choice time
                 
    V.SelfStatement_choiceTime(nt) = GetSecs - startTime ;   

    
    if anker_LR(nt)
        
        V.MindWanderingValue(nt) = ((mx - scaleXPos) / (scaleWidth / 2)); % Get the self-statement value from the mouse position
                    
    else
        
        V.MindWanderingValue(nt) = -1*((mx - scaleXPos) / (scaleWidth / 2)); %Pole in the other direction
                    
    end
    
end

    
    
    
Screen('Flip',wd); % clear the screen
    
% ....................... Fixation cross + ITI 
Screen('TextSize',wd,txtlarge);
DrawFormattedText(wd,'+','center','center',txtcolor);
Screen('TextSize',wd,txtsize);
onset_cross_var(nt) = Screen('Flip',wd);

if     strcmp(key,'no_response') & dp == 1
	WaitSecs((2*Z.display_choice_ontop)+Z.max_choice_time+Z.display_fb-Z.show_missing_sign-monitorFlipInterval);%ITI
elseif strcmp(key,'no_response') & dp == 2
	WaitSecs(Z.display_choice_ontop+Z.display_fb-Z.show_missing_sign-monitorFlipInterval);%ITI
end

onset_cross_offset_trial(nt) = GetSecs;

WaitSecs(5);

checkabort;