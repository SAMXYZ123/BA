i=0; clear tx ypos func;
func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die �bung ist nun zu Ende!';

i=i+1; 
	ypos{i}=yposm;
	tx{i}= ['Wenn dies keine �bung w�re, h�tten Sie ' num2str(payout) ' Euro erspielt.'];

% i=i+1; 
% 	ypos{i}=yposm;
% 	tx{i}='Zu welchen farbigen Kisten f�hrte die graue Kiste mit dem auf der Kante stehenden Rechteck h�ufiger?';
% 
% i=i+1; 
% 	ypos{i}=yposm;
% 	tx{i}='Zu welchen farbigen Kisten f�hrte die graue Kiste mit dem auf der Spitze stehenden Rechteck h�ufiger?';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Vielen Dank!';

instr_display;