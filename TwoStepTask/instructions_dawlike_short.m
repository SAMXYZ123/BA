%----------------------------------------------------------------------------
% Comment line for conditionals about win or loss
% IF wintrial TO SPLIT INSTR INTO WIN AND LOSS
% WALL: SO ONE CANNOT GO BACK AFTER TRAINING_TRIALS

i=0; clear tx ypos func;
 func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Nun möchten wir Ihnen die zweite Aufgabe erklären. Sie können mit der rechten und linken Taste vor- und zurückblättern.';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='In diesem Durchlauf haben Sie bis auf einen Unterschied genau die gleiche Aufgabe:';

%----------------------------------------------------------------------------    
if wintrial
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Eben ging es darum, so wenig Geld wie möglich zu verlieren. Nun geht es darum, so viel Geld wie möglich zu gewinnen! \nAlles andere bleibt gleich.';
        
        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['Die farbigen Kisten führen also zu einem Gewinn oder keinem Gewinn.'];
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stimch(2,2),[],box(2,:));getleftrightarrow;';

        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['Kurz nach der Entscheidung erfahren Sie, ob in der Kiste Geld ist (20 Cent)... '];
        func{i}='Screen(''DrawTexture'',wd,outcome(1),[],boxo);[wt]=Screen(wd,''TextBounds'',rew_txt);ypos1=boxo(2)-(1.5*wt(4));[wt]=Screen(wd,''TextBounds'',rew_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,rew_txt,''center'',ypos1,rew_col);DrawFormattedText(wd,rew_cent,''center'',ypos2,rew_col);getleftrightarrow;';

        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['...oder ob die Kiste leer ist (0 Cent).'];
        func{i}='Screen(''DrawTexture'',wd,outcome(2),[],boxo);[wt]=Screen(wd,''TextBounds'',pun_txt);ypos1=boxo(2)-(1.5*wt(4));[wt]=Screen(wd,''TextBounds'',pun_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,pun_txt,''center'',ypos1,pun_col);DrawFormattedText(wd,pun_cent,''center'',ypos2,pun_col);getleftrightarrow;';

else
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Eben ging es darum, so viel Geld wie möglich zu gewinnen. Nun geht es darum, so wenig Geld wie möglich zu verlieren! \nAlles andere bleibt gleich.';
        
        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['Die farbigen Kisten führen also zu einem Verlust oder keinem Verlust.'];
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stimch(2,2),[],box(2,:));getleftrightarrow;';

        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['Kurz nach der Entscheidung erfahren Sie, ob in der Kiste ein Verlust ist (-20 Cent)... '];
        func{i}='Screen(''DrawTexture'',wd,outcome(2),[],boxo);[wt]=Screen(wd,''TextBounds'',pun_txt);ypos1=boxo(2)-(1.5*wt(4));[wt]=Screen(wd,''TextBounds'',pun_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,pun_txt,''center'',ypos1,pun_col);DrawFormattedText(wd,pun_cent,''center'',ypos2,pun_col);getleftrightarrow;';
   
        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['...oder ob die Kiste leer ist (0 Cent).'];
        func{i}='Screen(''DrawTexture'',wd,outcome(1),[],boxo);[wt]=Screen(wd,''TextBounds'',rew_txt);ypos1=boxo(2)-(1.5*wt(4));[wt]=Screen(wd,''TextBounds'',rew_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,rew_txt,''center'',ypos1,rew_col);DrawFormattedText(wd,rew_cent,''center'',ypos2,rew_col);getleftrightarrow;';

end
%---------------------------------------------------------------------------- 
  

%----------------------------------------------------------------------------  
if wintrial
    
        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['Stellen Sie sich vor, dass jede Kiste mit einer bestimmten Chance Geld beinhaltet. Bei der einen Kiste haben Sie zum Beispiel eine Chance von 70% Geld zu finden. Um ein Gefühl hierfür zu entwickeln, werden wir das ausprobieren. Wählen Sie bitte die Kiste ein paar Mal aus, indem Sie die linke Taste  drücken.'];
        func{i}='trainprobreward';     
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        i=i+1;
        ypos{i}=yposm;
        tx{i}='Bei der anderen Kiste kann die Chance höher oder niedriger sein, Geld zu gewinnen und Sie sollen das herausfinden.';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        i=i+1;
        ypos{i}=ypost;
        tx{i}='Sie können jetzt 20 Mal zwischen zwei Kisten wählen. Versuchen Sie herauszufinden, in welcher Kiste Sie häufiger Geld finden. Ob Sie Geld finden, hängt nur von der Kiste ab, die Sie auspacken und nicht davon, ob die Kiste rechts oder links erscheint. ';
        func{i}='identifybetterstim;';
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
        i=i+1;
        ypos{i}=ypost;
        tx{i}='Je häufiger Sie sich für diese Kiste entscheiden, desto häufiger gewinnen Sie 20 Cent. Sie sollen immer versuchen die beste Kiste auszupacken.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));getleftrightarrow;';

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    

else
        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['Stellen Sie sich vor, dass jede Kiste mit einer bestimmten Chance einen Verlust beinhaltet. Bei der einen Kiste haben Sie zum Beispiel eine Chance von 70% zu verlieren. Um ein Gefühl hierfür zu entwickeln, werden wir das ausprobieren. Wählen Sie bitte die Kiste ein paar Mal aus, indem Sie die linke Taste  drücken.'];
        func{i}='trainprobreward';
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
        i=i+1;
        ypos{i}=yposm;
        tx{i}='Bei der anderen Kiste kann die Chance höher oder niedriger sein, Geld zu verlieren und Sie sollen das herausfinden.';
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        i=i+1;
        ypos{i}=ypost;
        tx{i}='Sie können jetzt 20 Mal zwischen zwei Kisten wählen. Versuchen Sie herauszufinden, in welcher Kiste Sie seltener Geld verlieren. Ob Sie Geld verlieren, hängt nur von der Kiste ab, die Sie auspacken und nicht davon, ob die Kiste rechts oder links erscheint. ';
        func{i}='identifybetterstim;';
        
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
%%%% CHANGED TEXT FOR LOSS         
        i=i+1;
        ypos{i}=ypost;
        tx{i}='Je häufiger Sie sich für diese Kiste entscheiden, desto seltener verlieren Sie 20 Cent. Sie sollen immer versuchen die beste Kiste auszupacken, also die Kiste, mit der Sie am seltensten verlieren.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));getleftrightarrow;';

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
end
%----------------------------------------------------------------------------  


if wintrial
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Als Zusammenfassung:\nSie entscheiden sich also zuerst für eine der grauen Kisten. Dadurch kommen Sie zu zwei farbigen Kisten und entscheiden sich für eine Kiste, die dann Geld enthält oder nicht. Ihr Ziel ist es so viel Geld wie möglich zu gewinnen.';
  
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Zusätzlich zu der Aufgabe werden wir Sie wieder manchmal Fragen, ob Sie noch völlig auf die Aufgabe fokussiert sind oder ob Sie an etwas anderes denken und z.B. tagträumen.';
        
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Diese Aufgabe ist schwierig. Sie müssen versuchen herauszufinden, welche der vier farbigen Kisten aktuell am häufigsten Geld beinhaltet und diese dann auswählen.\n\nDamit Sie überhaupt zu dieser Kiste gelangen, müssen Sie sich immer erst für eine graue Kiste entscheiden, die Sie häufiger zu der aktuell besten Kiste führt.';

           i=i+1; 
        ypos{i}=yposm;
        tx{i}='Zur Berechnung Ihres Gewinnes werden am Ende zufällig ein Drittel der Durchgänge bestimmt. Wie oft Sie in diesen gewonnen haben, ergibt Ihren Gewinn. Deshalb ist jeder Durchgang sehr wichtig, denn jeder kann zufällig ausgewählt werden.';


else
        
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Als Zusammenfassung:\nSie entscheiden sich also zuerst für eine der grauen Kisten. Dadurch kommen Sie zu zwei farbigen Kisten und entscheiden sich für eine Kiste, die dann Geld verliert oder nicht. Ihr Ziel ist es so wenig Geld wie möglich zu verlieren.';

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Diese Aufgabe ist schwierig. Sie müssen versuchen herauszufinden, welche der vier farbigen Kisten aktuell am seltensten Geld verliert und diese dann auswählen.\n\nDamit Sie überhaupt zu dieser Kiste gelangen, müssen Sie sich immer erst für eine graue Kiste entscheiden, die Sie häufiger zu der aktuell besten Kiste führt.';

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='In diesem Durchlauf starten Sie mit einem Guthaben von 7,50€. \nDieses Guthaben kann sich mit jedem Durchlauf, bei dem Sie verlieren, potentiell verringern:';
        
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Am Ende werden zufällig ein Drittel der Durchgänge bestimmt. Von diesen Druchgängen wird dann jeder Verlust von Ihrem Startguthaben abgezogen. Deshalb ist jeder Durchgang sehr wichtig, denn jeder kann zufällig ausgewählt werden.';
end
%----------------------------------------------------------------------------   

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Falls Sie noch Fragen haben, wenden Sie sich bitte jetzt an uns.\nSie können sich die Anleitungen nochmal anschauen. Wenden Sie sich dafür an den Versuchsleiter.';

instr_display; % CHANGES IN GETLEFTRIGHTARROW FOR WALL
