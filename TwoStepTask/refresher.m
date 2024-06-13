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
	tx{i}='Die grauen Kisten führen wieder zu den farbigen Kisten.'; 
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Die eine graue Kiste führt häufiger zu dem einem Paar farbigen Kisten und die andere graue Kiste führt häufiger zu dem anderen Paar farbige Kisten.';

i=i+1; 
	ypos{i}=yposm;
    tx{i}='Dies verändert sich während des gesamten Gewinnspiels nicht. Aber Sie müssen selbst herausfinden, welche graue Kiste öfter zu welchem Paar farbige Kisten führt.';

if wintrial    
    
    i=i+1; 
        ypos{i}=yposm;
        tx{i}='Die zwei Paare farbige Kisten führen wiederum zu einem Gewinn oder nicht. Wie oft jedes Bild zu einem Gewinn führt, verändert sich langsam.';
else
     i=i+1; 
        ypos{i}=yposm;
        tx{i}='Die zwei Paare farbige Kisten führen wiederum zu einem Verlust oder nicht. Wie oft jedes Bild zu einem Verlust führt, verändert sich langsam.';

end

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Eine farbige Kiste, die anfangs schlecht war, kann später gut sein und eine andere farbige Kiste kann in der Mitte des Experiments am besten sein usw.';
    
    i=i+1; 
    ypos{i}=yposm;
    tx{i}='Zusätzlich zu der Aufgabe werden wir Sie wieder manchmal Fragen, ob Sie noch völlig auf die Aufgabe fokussiert sind oder ob Sie an etwas anderes denken und z.B. tagträumen.';

   
  
if wintrial  
    
    i=i+1; 
        ypos{i}=yposm;
        tx{i}='Ab jetzt können Sie tatsächlich Geld gewinnen, deshalb ist jeder Durchgang wichtig!';
else
    i=i+1; 
        ypos{i}=yposm;
        tx{i}='Ab jetzt können Sie tatsächlich Geld verlieren, deshalb ist jeder Durchgang wichtig!';
end

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Erklären Sie der Laborleitung bitte Ihre Aufgabe.';


i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wenden Sie sich an Ihre Laborleitung. \nBitte bringen Sie jetzt das taVNS an.';

instr_display;
