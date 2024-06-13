%----------------------------------------------------------------------------
% Comment line for conditionals about win or loss
% IF WINTRIAL TO SPLIT INSTR INTO WIN AND LOSS
% WALL: SO ONE CANNOT GO BACK AFTER TRAINING_TRIALS

i=0; clear tx ypos func;
 func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Im folgenden möchten wir Sie bitten einige Probedurchgänge zu absolvieren. In diesen Durchgängen können Sie noch kein Geld gewinnen. Drücken Sie weiter um das Training zu starten. ';

instr_display; % CHANGES IN GETLEFTRIGHTARROW FOR WALL
