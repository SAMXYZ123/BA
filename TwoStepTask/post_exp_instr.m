i=0; clear tx ypos func;
func{1}=[];

i=i+1; 
	ypos{i}=yposm;
	tx{i}= ['Sie haben ' num2str(payout) ' Euro verdient.'];

i=i+1; 
	ypos{i}=yposm;
	tx{i}= 'Das Experiment ist nun zu Ende. Vielen Dank.';

instr_display_no_press;

