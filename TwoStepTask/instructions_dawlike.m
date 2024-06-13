%----------------------------------------------------------------------------
% Comment line for conditionals about win or loss
% IF WINTRIAL TO SPLIT INSTR INTO WIN AND LOSS
% WALL: SO ONE CANNOT GO BACK AFTER TRAINING_TRIALS // NEEDS TWO WALLS

 i=0; clear tx ypos func; 
  func{1}=[];
 
i=i+1;
	ypos{i}=yposm;
	tx{i}='Wir möchten Ihnen jetzt die Aufgabe erklären. Sie können mit der rechten und linken Taste vor- und zurückblättern.';

%----------------------------------------------------------------------------    
if wintrial

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Es geht darum so viel Geld wie möglich zu gewinnen.';

else

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Es geht darum so wenig Geld wie möglich zu verlieren.';

end
%---------------------------------------------------------------------------- 

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Jeder Durchgang besteht aus zwei aufeinanderfolgenden Entscheidungen. Sie sehen immer zwei gleichfarbige Kisten, die sich durch eine Figur unterscheiden.\nBei der ersten Entscheidung wählen Sie immer zwischen zwei grauen Kisten:'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

%----------------------------------------------------------------------------        
if wintrial    

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Wenn Sie eine dieser Kisten auspacken, finden Sie kein Geld, aber Sie kommen abhängig von Ihrer Entscheidung häufiger zu jeweils einem Paar farbige Kisten.'; 
        func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

else 

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Wenn Sie eine dieser Kisten auspacken, verlieren Sie noch kein Geld, aber Sie kommen abhängig von Ihrer Entscheidung häufiger zu jeweils einem Paar farbige Kisten.'; 
        func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

end
%----------------------------------------------------------------------------    

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Zum Beispiel:'];
	func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Hier führt die Entscheidung für die eine graue Kiste häufiger zu einem bestimmten Paar farbige Kisten...'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],instrall(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],instrall(2,:)); getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...während die Entscheidung für die andere graue Kiste\n häufiger zu einem anderen Paar farbige Kisten führt.'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,2),[],instrall(3,:));Screen(''DrawTexture'',wd,stim(3,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stim(3,2),[],instrall(2,:)); getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Dieser Zusammenhang zwischen einer der grauen Kisten und den häufigeren, farbigen Kisten bleibt immer gleich!\n\nEs mischt allerdings der Zufall ein wenig mit, so dass die eine graue Kiste nicht immer zu dem einen Paar farbigen Kisten führt und die andere graue Kiste auch nicht immer zu den anderen farbigen Kisten.'];
    func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Zum Beispiel führt die eine graue Kiste in 7 von 10 Fällen zu den zwei farbigen Kisten und nur in 3 von 10 Fällen zu den anderen farbigen Kisten.'];
    func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer, wenn Sie zwei Bilder sehen, haben Sie 2 Sekunden Zeit, eines der beiden auszuwählen.\n\nDazu drücken Sie bitte die linke Taste für das linke Bild\nund die rechte Taste für das rechte Bild.'];

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Versuchen Sie das jetzt einige Male:';

% Ohne Feedback, ohne Choice 2nd step
i=i+1; 

	ypos{i}=ypost;
	func{i}='instr_steps = 1;for nt = 1:4; twosteptrial; end; getleftrightarrow;';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Wie bereits gesagt, dieser Zusammenhang zwischen der ersten Entscheidung und den häufigeren farbigen Kisten bleibt immer gleich!'];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Gibt es hierzu bisher Fragen?'];


%----------------------------------------------------------------------------            
if wintrial

        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['Nur bei den farbigen Kisten können Sie tatsächlich Geld gewinnen. Sind Sie durch Auswahl einer grauen Kiste zu zwei farbigen Kisten gelangt, so müssen Sie sich für eine der beiden farbigen Kisten entscheiden.'];
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],box(2,:));getleftrightarrow;';

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
        ypos{i}=ypost;
        tx{i}=['Nur bei den farbigen Kisten können Sie tatsächlich Geld verlieren. Sind Sie durch Auswahl einer grauen Kiste zu zwei farbigen Kisten gelangt, so müssen Sie sich für eine der beiden farbigen Kisten entscheiden.'];
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],box(2,:));getleftrightarrow;';

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
        tx{i}=['Stellen Sie sich vor, dass jede Kiste mit einer bestimmten Chance Geld beinhaltet. Bei der einen Kiste haben Sie zum Beispiel eine Chance von 60% Geld zu finden. Um ein Gefühl hierfür zu entwickeln, werden wir das ausprobieren. Wählen Sie bitte die Kiste ein paar mal aus, indem Sie die linke Taste  drücken.'];
        func{i}='trainprobreward';     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        i=i+1;
        ypos{i}=yposm;
        tx{i}='Bei der anderen Kiste kann die Chance höher oder niedriger sein Geld zu gewinnen und Sie sollen das herausfinden.';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        i=i+1;
        ypos{i}=ypost;
        tx{i}='Sie können jetzt 20 mal zwischen zwei Kisten wählen. Versuchen Sie herauszufinden, in welcher Kiste Sie häufiger Geld finden. Ob Sie Geld finden, hängt nur von der Kiste ab, die Sie auspacken und nicht davon, ob die Kiste rechts oder links erscheint. ';
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
        tx{i}=['Stellen Sie sich vor, dass jede Kiste mit einer bestimmten Chance einen Verlust beinhaltet. Bei der einen Kiste haben Sie zum Beispiel eine Chance von 70% zu verlieren. Um ein Gefühl hierfür zu entwickeln, werden wir das ausprobieren. Wählen Sie bitte die Kiste ein paar mal aus, indem Sie die linke Taste  drücken.'];
        func{i}='trainprobreward';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        i=i+1;
        ypos{i}=yposm;
        tx{i}='Bei der anderen Kiste kann die Chance höher oder niedriger sein Geld zu verlieren und Sie sollen das herausfinden.';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        i=i+1;
        ypos{i}=ypost;
        tx{i}='Sie können jetzt 20 mal zwischen zwei Kisten wählen. Versuchen Sie herauszufinden, in welcher Kiste Sie seltener Geld verlieren. Ob Sie Geld verlieren, hängt nur von der Kiste ab, die Sie auspacken und nicht davon, ob die Kiste rechts oder links erscheint. ';
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

i=i+1;
	ypos{i}=ypost;
	tx{i}='Später ist das ein wenig schwieriger:\n\n1) Es gibt zwei farbige Paare Kisten:';
    func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

%----------------------------------------------------------------------------  
if wintrial

        i=i+1;
        ypos{i}=ypost;
        tx{i}='2) Die Chance, dass eine Kiste Geld enthält, verändert sich langsam. Sie kann also langsam höher oder niedriger werden. Das besprechen wir jetzt noch mal genauer.';
        func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Es kann sein, dass eine Kiste am Anfang sehr häufig Geld enthält...';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));for k=2:4;Screen(''DrawTexture'',wd,instrfig(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.8);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...dann aber immer seltener.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,instrfig(5),[],instrfigbox);getleftrightarrow;';


else
        i=i+1;
        ypos{i}=ypost;
        tx{i}='2) Die Chance, dass eine Kiste einen Verlust enthält, verändert sich langsam. Sie kann also langsam höher oder niedriger werden. Das besprechen wir jetzt noch mal genauer.';
        func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Es kann sein, dass eine Kiste am Anfang sehr häufig einen Verlust enthält...';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));for k=2:4;Screen(''DrawTexture'',wd,instrfig(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.8);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...dann aber immer seltener.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,instrfig(5),[],instrfigbox);getleftrightarrow;';

end
%----------------------------------------------------------------------------  

%----------------------------------------------------------------------------  
if wintrial

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Wenn Sie immer diese Kiste auspacken, gewinnen Sie anfangs häufig... ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));for k=1:16;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...und finden später immer seltener Geld. ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));for k=17:32;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Währenddessen kann es passieren, dass die andere Kiste besser wird, also häufiger Geld enthält.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(6),[],instrfigbox);getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Und auch das kann sich im weiteren Verlauf wieder verändern.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

else
        i=i+1;
        ypos{i}=ypost;
        tx{i}='Wenn Sie immer diese Kiste auspacken, verlieren Sie anfangs häufig... ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));for k=1:16;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...und verlieren später immer seltener. ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));for k=17:32;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Währenddessen kann es passieren, dass die andere Kiste schlechter wird, also häufiger Geld verliert.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(6),[],instrfigbox);getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Und auch das kann sich im weiteren Verlauf wieder verändern.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

end
%----------------------------------------------------------------------------  

%----------------------------------------------------------------------------  
if wintrial

        i=i+1;
        ypos{i}=ypost;
        tx{i}='In diesem Fall würden Sie am meisten Geld gewinnen, wenn Sie zuerst immer die eine Kiste auspacken... ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...dann eine Weile lang die andere Kiste und am Ende wieder die erste Kiste.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

else

        i=i+1;
        ypos{i}=ypost;
        tx{i}='In diesem Fall würden Sie am meisten Geld verlieren, wenn Sie zuerst immer die eine Kiste auspacken... ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...dann eine Weile lang die andere Kiste und am Ende wieder die erste Kiste.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

end
%----------------------------------------------------------------------------  

%----------------------------------------------------------------------------  
if wintrial

        i=i+1;
        ypos{i}=yposm;
        tx{i}='Das ist nur ein Beispiel. Der Verlauf kann auch ganz anders sein. Die Veränderungen sind also unvorhersagbar.\n\nAber die Veränderungen sind recht langsam. Das heißt, dass eine Kiste mindestens ein paar Runden häufig Geld enthält und eine andere Kiste auch für ein paar Runden lang selten Geld enthält.';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Insgesamt gibt es also zwei Paare farbige Kisten, die Geld enthalten können:';
        func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Als Zusammenfassung:\nSie entscheiden sich also zuerst für eine der grauen Kisten. Dadurch kommen Sie zu zwei farbigen Kisten und entscheiden sich für eine Kiste, die dann Geld enthält oder nicht.';


else

        i=i+1;
        ypos{i}=yposm;
        tx{i}='Das ist nur ein Beispiel. Der Verlauf kann auch ganz anders sein. Die Veränderungen sind also unvorhersagbar.\n\nAber die Veränderungen sind recht langsam. Das heißt, dass eine Kiste mindestens ein paar Runden häufig Geld verliert und eine andere Kiste auch für ein paar Runden lang selten Geld verliert.';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Insgesamt gibt es also zwei Paare farbige Kisten, die Geld verlieren können:';
        func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Als Zusammenfassung:\nSie entscheiden sich also zuerst für eine der grauen Kisten. Dadurch kommen Sie zu zwei farbigen Kisten und entscheiden sich für eine Kiste, die dann Geld verliert oder nicht.';

end
%----------------------------------------------------------------------------      
	   
i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer wenn Sie zwei Kisten sehen, haben Sie 2 Sekunden Zeit sich für eine der beiden zu entscheiden.\n\nDazu drücken Sie bitte die linke Taste für die linke Kiste\nund die rechte Taste für die rechte Kiste.'];
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Bitte üben Sie diesen Ablauf jetzt einige Male.';

% Jetzt komplett (mit vollständigen 2nd step und feedback)
i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 0;for nt = 1:8;twosteptrial;end;getleftrightarrow;';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
%----------------------------------------------------------------------------      
if wintrial
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Diese Aufgabe ist schwierig. Sie müssen versuchen herauszufinden, welche der vier farbigen Kisten aktuell am häufigsten Geld beinhaltet und diese dann auswählen.\n\nDamit Sie überhaupt zu dieser Kiste gelangen, müssen Sie sich immer erst für eine graue Kiste entscheiden, die Sie häufiger zu der aktuell besten Kiste führt.';

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Wie viel Sie verdienen, hängt ein bisschen von Glück ab,\naber vor allem davon, wie gut Sie auswählen.'; 

else
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Diese Aufgabe ist schwierig. Sie müssen versuchen herauszufinden, welche der vier farbigen Kisten aktuell am seltensten Geld verliert und diese dann auswählen.\n\nDamit Sie überhaupt zu dieser Kiste gelangen, müssen Sie sich immer erst für eine graue Kiste entscheiden, die Sie häufiger zu der aktuell besten Kiste führt.';

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Wieviel Sie verlieren hängt ein bisschen von Glück ab,\naber vor allem davon, wie gut Sie auswählen.'; 

end
%----------------------------------------------------------------------------      

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Falls Sie noch Fragen haben, wenden Sie sich bitte jetzt an uns.\nSie können sich die Anleitungen nochmal anschauen. Wenden Sie sich dafür an den Versuchsleiter.';

%----------------------------------------------------------------------------   
if wintrial
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Zur Berechnung Ihres Gewinnes werden am Ende zufällig ein Drittel der Durchgänge bestimmt. Wie oft Sie in diesen gewonnen haben, ergibt Ihren Gewinn. Deshalb ist jeder Durchgang sehr wichtig, denn jeder kann zufällig ausgewählt werden. Diesen Gewinn werden Sie im echten Durchgang auch tatsächlich erhalten, in der gleich folgenden Übung nicht.';

else
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Zur Berechnung Ihres übrig gebliebenen Gewinnes (Daher Ihr Anfangsguthaben minus des Verlusts) werden am Ende zufällig ein Drittel der Durchgänge bestimmt. Wie oft Sie in diesen verloren haben, ergibt Ihren Gewinn. Deshalb ist jeder Durchgang sehr wichtig, denn jeder kann zufällig ausgewählt werden. Diesen Gewinn werden Sie im echten Durchgang auch tatsächlich erhalten, in der gleich folgenden Übung nicht.';
end
%----------------------------------------------------------------------------   
    i=i+1; 
	ypos{i}=yposm;
	tx{i}='Zusätzlich zu der Aufgabe werden wir Sie manchmal fragen, ob Sie noch völlig auf die Aufgabe fokussiert sind oder ob Sie an etwas anderes denken und z.B. tagträumen.';
    
    i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es ist völlig in Ordnung, wenn Ihre Gedanken während der Aufgabe abschweifen. \nWichtig ist nur, dass Sie das bei der Abfrage ehrlich angeben.';
    
    
    i=i+1; 
	ypos{i}=yposm;
	tx{i}='Dafür öffnet sich eine Abfrage-Maske bei der Sie mit der Maus einen Regler nach links oder rechts schieben können und per Mausklick Ihren Wert auf der der Skala auswählen. \nDrücken Sie die Pfeiltaste, um das einmal zu probieren:';
    
    
    i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 1;for nt = 1:1;SelfStatement;end;getleftrightarrow;';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    i=i+1; 
	ypos{i}=yposm;
	tx{i}='Während des Experiments ändert sich die Richtung, mit der Sie eine gewisse Antwort geben zufällig. \nDas bedeutet, dass Sie in einem Durchlauf möglicherweise auf der linken Seite angeben, dass Sie fokussiert sind, während Sie im nächsten Durchlauf auf der gleichen Seite angeben, dass Ihre Gedanken woanders sind. Beachten Sie das, damit Sie keine falsche angabe machen.';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    i=i+1; 
	ypos{i}=yposm;
	tx{i}=' Außerdem ist es wichtig, dass Sie Ihre Antwort so schnell wie möglich geben. Versuchen Sie das noch einige Male:';
    
    
    i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 1;for nt = 2:4;SelfStatement;end;getleftrightarrow;';

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir möchten jetzt sicherstellen, dass Sie alles verstanden haben.\nBitte erklären Sie, was Ihre Aufgabe in diesem Spiel ist.\nDrücken Sie dann die rechte Taste um mit einem Übungsdurchgang zu beginnen. Dieser dauert ca. 9min.';

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
instr_display; 
