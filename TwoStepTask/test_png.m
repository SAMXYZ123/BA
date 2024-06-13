% Clear the workspace and close any open windows
clear all;
close all;

try
    % Initialize Psychtoolbox
    PsychDefaultSetup(2);
    screens = Screen('Screens');
    screenNumber = max(screens);
    [window, windowRect] = PsychImaging('OpenWindow', screenNumber, [0 0 0]);
    
    % Load the PNG image
    imagePath = '/Users/SAM/Downloads/jpg2png/S2_2_2.png';  % Replace with the actual path
    imageTexture = imread(imagePath);
    
    if numel(size(imageTexture)) == 3  % Check if the image has color channels
        imageTexture = imageTexture(:, :, 1:3);  % Remove alpha channel if present
    end
    
    % Get the dimensions of the image
    imageSize = size(imageTexture);
    imageWidth = imageSize(2);
    imageHeight = imageSize(1);
    
    % Calculate the position to center the image on the screen
    centerX = windowRect(3) / 2;
    centerY = windowRect(4) / 2;
    imageRect = [centerX - imageWidth / 2, centerY - imageHeight / 2, centerX + imageWidth / 2, centerY + imageHeight / 2];
    
    % Draw a white background
    Screen('FillRect', window, [255 255 255]);
    
    % Draw the image
    imageTexture = Screen('MakeTexture', window, imageTexture);
    Screen('DrawTexture', window, imageTexture, [], imageRect);
    Screen('Flip', window);
    
    % Wait for a key press to close the window
    KbWait;
    
    % Close the window and clean up
    sca;
    
catch exception
    % If an error occurs, close the window and show the error message
    sca;
    rethrow(exception);
end
