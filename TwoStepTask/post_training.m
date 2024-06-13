i=0; clear tx ypos func;
func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die Übung ist nun zu Ende!';

i=i+1; 
	ypos{i}=yposm;
	tx{i}= ['Wenn dies keine Übung wäre, hätten Sie ' num2str(payout) ' Euro erspielt.'];

% i=i+1; 
% 	ypos{i}=yposm;
% 	tx{i}='Zu welchen farbigen Kisten führte die graue Kiste mit dem auf der Kante stehenden Rechteck häufiger?';
% 
% i=i+1; 
% 	ypos{i}=yposm;
% 	tx{i}='Zu welchen farbigen Kisten führte die graue Kiste mit dem auf der Spitze stehenden Rechteck häufiger?';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Vielen Dank!';

instr_display;