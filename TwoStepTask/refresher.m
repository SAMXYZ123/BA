i=0; clear tx ypos func;
func{1}=[];

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir fangen jetzt mit dem wirklichen Gewinnspiel an!';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es ist alles wie zuvor, nur dass wir jetzt mit neuen Kisten anfangen.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die grauen Kisten f�hren wieder zu den farbigen Kisten.'; 
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die eine graue Kiste f�hrt h�ufiger zu dem einem Paar farbigen Kisten und die andere graue Kiste f�hrt h�ufiger zu dem anderen Paar farbige Kisten.';

i=i+1; 
	ypos{i}=yposm;
    tx{i}='Dies ver�ndert sich w�hrend des gesamten Gewinnspiels nicht. Aber Sie m�ssen selbst herausfinden, welche graue Kiste �fter zu welchem Paar farbige Kisten f�hrt.';

if wintrial    
    
    i=i+1; 
        ypos{i}=yposm;
        tx{i}='Die zwei Paare farbige Kisten f�hren wiederum zu einem Gewinn oder nicht. Wie oft jedes Bild zu einem Gewinn f�hrt, ver�ndert sich langsam.';
else
     i=i+1; 
        ypos{i}=yposm;
        tx{i}='Die zwei Paare farbige Kisten f�hren wiederum zu einem Verlust oder nicht. Wie oft jedes Bild zu einem Verlust f�hrt, ver�ndert sich langsam.';

end

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Eine farbige Kiste, die anfangs schlecht war, kann sp�ter gut sein und eine andere farbige Kiste kann in der Mitte des Experiments am besten sein usw.';
    
    i=i+1; 
    ypos{i}=yposm;
    tx{i}='Zus�tzlich zu der Aufgabe werden wir Sie wieder manchmal Fragen, ob Sie noch v�llig auf die Aufgabe fokussiert sind oder ob Sie an etwas anderes denken und z.B. tagtr�umen.';

   
  
if wintrial  
    
    i=i+1; 
        ypos{i}=yposm;
        tx{i}='Ab jetzt k�nnen Sie tats�chlich Geld gewinnen, deshalb ist jeder Durchgang wichtig!';
else
    i=i+1; 
        ypos{i}=yposm;
        tx{i}='Ab jetzt k�nnen Sie tats�chlich Geld verlieren, deshalb ist jeder Durchgang wichtig!';
end

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Erkl�ren Sie der Laborleitung bitte Ihre Aufgabe.';


i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wenden Sie sich an Ihre Laborleitung. \nBitte bringen Sie jetzt das taVNS an.';

instr_display;
