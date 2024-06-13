%----------------------------------------------------------------------------
% Comment line for conditionals about win or loss
% IF WINTRIAL TO SPLIT INSTR INTO WIN AND LOSS
% WALL: SO ONE CANNOT GO BACK AFTER TRAINING_TRIALS // NEEDS TWO WALLS

 i=0; clear tx ypos func; 
  func{1}=[];
 
i=i+1;
	ypos{i}=yposm;
	tx{i}='Wir m�chten Ihnen jetzt die Aufgabe erkl�ren. Sie k�nnen mit der rechten und linken Taste vor- und zur�ckbl�ttern.';

%----------------------------------------------------------------------------    
if wintrial

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Es geht darum so viel Geld wie m�glich zu gewinnen.';

else

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Es geht darum so wenig Geld wie m�glich zu verlieren.';

end
%---------------------------------------------------------------------------- 

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Jeder Durchgang besteht aus zwei aufeinanderfolgenden Entscheidungen. Sie sehen immer zwei gleichfarbige Kisten, die sich durch eine Figur unterscheiden.\nBei der ersten Entscheidung w�hlen Sie immer zwischen zwei grauen Kisten:'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

%----------------------------------------------------------------------------        
if wintrial    

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Wenn Sie eine dieser Kisten auspacken, finden Sie kein Geld, aber Sie kommen abh�ngig von Ihrer Entscheidung h�ufiger zu jeweils einem Paar farbige Kisten.'; 
        func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

else 

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Wenn Sie eine dieser Kisten auspacken, verlieren Sie noch kein Geld, aber Sie kommen abh�ngig von Ihrer Entscheidung h�ufiger zu jeweils einem Paar farbige Kisten.'; 
        func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

end
%----------------------------------------------------------------------------    

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Zum Beispiel:'];
	func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Hier f�hrt die Entscheidung f�r die eine graue Kiste h�ufiger zu einem bestimmten Paar farbige Kisten...'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],instrall(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],instrall(2,:)); getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...w�hrend die Entscheidung f�r die andere graue Kiste\n h�ufiger zu einem anderen Paar farbige Kisten f�hrt.'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,2),[],instrall(3,:));Screen(''DrawTexture'',wd,stim(3,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stim(3,2),[],instrall(2,:)); getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Dieser Zusammenhang zwischen einer der grauen Kisten und den h�ufigeren, farbigen Kisten bleibt immer gleich!\n\nEs mischt allerdings der Zufall ein wenig mit, so dass die eine graue Kiste nicht immer zu dem einen Paar farbigen Kisten f�hrt und die andere graue Kiste auch nicht immer zu den anderen farbigen Kisten.'];
    func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Zum Beispiel f�hrt die eine graue Kiste in 7 von 10 F�llen zu den zwei farbigen Kisten und nur in 3 von 10 F�llen zu den anderen farbigen Kisten.'];
    func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer, wenn Sie zwei Bilder sehen, haben Sie 2 Sekunden Zeit, eines der beiden auszuw�hlen.\n\nDazu dr�cken Sie bitte die linke Taste f�r das linke Bild\nund die rechte Taste f�r das rechte Bild.'];

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
	tx{i}=['Wie bereits gesagt, dieser Zusammenhang zwischen der ersten Entscheidung und den h�ufigeren farbigen Kisten bleibt immer gleich!'];

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
        tx{i}=['Nur bei den farbigen Kisten k�nnen Sie tats�chlich Geld gewinnen. Sind Sie durch Auswahl einer grauen Kiste zu zwei farbigen Kisten gelangt, so m�ssen Sie sich f�r eine der beiden farbigen Kisten entscheiden.'];
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
        tx{i}=['Nur bei den farbigen Kisten k�nnen Sie tats�chlich Geld verlieren. Sind Sie durch Auswahl einer grauen Kiste zu zwei farbigen Kisten gelangt, so m�ssen Sie sich f�r eine der beiden farbigen Kisten entscheiden.'];
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
        tx{i}=['Stellen Sie sich vor, dass jede Kiste mit einer bestimmten Chance Geld beinhaltet. Bei der einen Kiste haben Sie zum Beispiel eine Chance von 60% Geld zu finden. Um ein Gef�hl hierf�r zu entwickeln, werden wir das ausprobieren. W�hlen Sie bitte die Kiste ein paar mal aus, indem Sie die linke Taste  dr�cken.'];
        func{i}='trainprobreward';     

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        i=i+1;
        ypos{i}=yposm;
        tx{i}='Bei der anderen Kiste kann die Chance h�her oder niedriger sein Geld zu gewinnen und Sie sollen das herausfinden.';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        i=i+1;
        ypos{i}=ypost;
        tx{i}='Sie k�nnen jetzt 20 mal zwischen zwei Kisten w�hlen. Versuchen Sie herauszufinden, in welcher Kiste Sie h�ufiger Geld finden. Ob Sie Geld finden, h�ngt nur von der Kiste ab, die Sie auspacken und nicht davon, ob die Kiste rechts oder links erscheint. ';
        func{i}='identifybetterstim;';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        i=i+1;
        ypos{i}=ypost;
        tx{i}='Je h�ufiger Sie sich f�r diese Kiste entscheiden, desto h�ufiger gewinnen Sie 20 Cent. Sie sollen immer versuchen die beste Kiste auszupacken.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));getleftrightarrow;';

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


else
        i=i+1; 
        ypos{i}=ypost;
        tx{i}=['Stellen Sie sich vor, dass jede Kiste mit einer bestimmten Chance einen Verlust beinhaltet. Bei der einen Kiste haben Sie zum Beispiel eine Chance von 70% zu verlieren. Um ein Gef�hl hierf�r zu entwickeln, werden wir das ausprobieren. W�hlen Sie bitte die Kiste ein paar mal aus, indem Sie die linke Taste  dr�cken.'];
        func{i}='trainprobreward';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        i=i+1;
        ypos{i}=yposm;
        tx{i}='Bei der anderen Kiste kann die Chance h�her oder niedriger sein Geld zu verlieren und Sie sollen das herausfinden.';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


        i=i+1;
        ypos{i}=ypost;
        tx{i}='Sie k�nnen jetzt 20 mal zwischen zwei Kisten w�hlen. Versuchen Sie herauszufinden, in welcher Kiste Sie seltener Geld verlieren. Ob Sie Geld verlieren, h�ngt nur von der Kiste ab, die Sie auspacken und nicht davon, ob die Kiste rechts oder links erscheint. ';
        func{i}='identifybetterstim;';

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% CHANGED TEXT FOR LOSS         
        i=i+1;
        ypos{i}=ypost;
        tx{i}='Je h�ufiger Sie sich f�r diese Kiste entscheiden, desto seltener verlieren Sie 20 Cent. Sie sollen immer versuchen die beste Kiste auszupacken, also die Kiste, mit der Sie am seltensten verlieren.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));getleftrightarrow;';

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end
%----------------------------------------------------------------------------  

i=i+1;
	ypos{i}=ypost;
	tx{i}='Sp�ter ist das ein wenig schwieriger:\n\n1) Es gibt zwei farbige Paare Kisten:';
    func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

%----------------------------------------------------------------------------  
if wintrial

        i=i+1;
        ypos{i}=ypost;
        tx{i}='2) Die Chance, dass eine Kiste Geld enth�lt, ver�ndert sich langsam. Sie kann also langsam h�her oder niedriger werden. Das besprechen wir jetzt noch mal genauer.';
        func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Es kann sein, dass eine Kiste am Anfang sehr h�ufig Geld enth�lt...';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));for k=2:4;Screen(''DrawTexture'',wd,instrfig(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.8);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...dann aber immer seltener.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,instrfig(5),[],instrfigbox);getleftrightarrow;';


else
        i=i+1;
        ypos{i}=ypost;
        tx{i}='2) Die Chance, dass eine Kiste einen Verlust enth�lt, ver�ndert sich langsam. Sie kann also langsam h�her oder niedriger werden. Das besprechen wir jetzt noch mal genauer.';
        func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Es kann sein, dass eine Kiste am Anfang sehr h�ufig einen Verlust enth�lt...';
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
        tx{i}='Wenn Sie immer diese Kiste auspacken, gewinnen Sie anfangs h�ufig... ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));for k=1:16;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...und finden sp�ter immer seltener Geld. ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));for k=17:32;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='W�hrenddessen kann es passieren, dass die andere Kiste besser wird, also h�ufiger Geld enth�lt.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(6),[],instrfigbox);getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Und auch das kann sich im weiteren Verlauf wieder ver�ndern.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

else
        i=i+1;
        ypos{i}=ypost;
        tx{i}='Wenn Sie immer diese Kiste auspacken, verlieren Sie anfangs h�ufig... ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));for k=1:16;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...und verlieren sp�ter immer seltener. ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));for k=17:32;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='W�hrenddessen kann es passieren, dass die andere Kiste schlechter wird, also h�ufiger Geld verliert.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(6),[],instrfigbox);getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Und auch das kann sich im weiteren Verlauf wieder ver�ndern.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

end
%----------------------------------------------------------------------------  

%----------------------------------------------------------------------------  
if wintrial

        i=i+1;
        ypos{i}=ypost;
        tx{i}='In diesem Fall w�rden Sie am meisten Geld gewinnen, wenn Sie zuerst immer die eine Kiste auspacken... ';
        func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,2),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='...dann eine Weile lang die andere Kiste und am Ende wieder die erste Kiste.';
        func{i}='Screen(''DrawTexture'',wd,stim(2,2),[],box2(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],box2(2,:));Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

else

        i=i+1;
        ypos{i}=ypost;
        tx{i}='In diesem Fall w�rden Sie am meisten Geld verlieren, wenn Sie zuerst immer die eine Kiste auspacken... ';
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
        tx{i}='Das ist nur ein Beispiel. Der Verlauf kann auch ganz anders sein. Die Ver�nderungen sind also unvorhersagbar.\n\nAber die Ver�nderungen sind recht langsam. Das hei�t, dass eine Kiste mindestens ein paar Runden h�ufig Geld enth�lt und eine andere Kiste auch f�r ein paar Runden lang selten Geld enth�lt.';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Insgesamt gibt es also zwei Paare farbige Kisten, die Geld enthalten k�nnen:';
        func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Als Zusammenfassung:\nSie entscheiden sich also zuerst f�r eine der grauen Kisten. Dadurch kommen Sie zu zwei farbigen Kisten und entscheiden sich f�r eine Kiste, die dann Geld enth�lt oder nicht.';


else

        i=i+1;
        ypos{i}=yposm;
        tx{i}='Das ist nur ein Beispiel. Der Verlauf kann auch ganz anders sein. Die Ver�nderungen sind also unvorhersagbar.\n\nAber die Ver�nderungen sind recht langsam. Das hei�t, dass eine Kiste mindestens ein paar Runden h�ufig Geld verliert und eine andere Kiste auch f�r ein paar Runden lang selten Geld verliert.';

        i=i+1;
        ypos{i}=ypost;
        tx{i}='Insgesamt gibt es also zwei Paare farbige Kisten, die Geld verlieren k�nnen:';
        func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Als Zusammenfassung:\nSie entscheiden sich also zuerst f�r eine der grauen Kisten. Dadurch kommen Sie zu zwei farbigen Kisten und entscheiden sich f�r eine Kiste, die dann Geld verliert oder nicht.';

end
%----------------------------------------------------------------------------      
	   
i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer wenn Sie zwei Kisten sehen, haben Sie 2 Sekunden Zeit sich f�r eine der beiden zu entscheiden.\n\nDazu dr�cken Sie bitte die linke Taste f�r die linke Kiste\nund die rechte Taste f�r die rechte Kiste.'];
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Bitte �ben Sie diesen Ablauf jetzt einige Male.';

% Jetzt komplett (mit vollst�ndigen 2nd step und feedback)
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
        tx{i}='Diese Aufgabe ist schwierig. Sie m�ssen versuchen herauszufinden, welche der vier farbigen Kisten aktuell am h�ufigsten Geld beinhaltet und diese dann ausw�hlen.\n\nDamit Sie �berhaupt zu dieser Kiste gelangen, m�ssen Sie sich immer erst f�r eine graue Kiste entscheiden, die Sie h�ufiger zu der aktuell besten Kiste f�hrt.';

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Wie viel Sie verdienen, h�ngt ein bisschen von Gl�ck ab,\naber vor allem davon, wie gut Sie ausw�hlen.'; 

else
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Diese Aufgabe ist schwierig. Sie m�ssen versuchen herauszufinden, welche der vier farbigen Kisten aktuell am seltensten Geld verliert und diese dann ausw�hlen.\n\nDamit Sie �berhaupt zu dieser Kiste gelangen, m�ssen Sie sich immer erst f�r eine graue Kiste entscheiden, die Sie h�ufiger zu der aktuell besten Kiste f�hrt.';

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Wieviel Sie verlieren h�ngt ein bisschen von Gl�ck ab,\naber vor allem davon, wie gut Sie ausw�hlen.'; 

end
%----------------------------------------------------------------------------      

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Falls Sie noch Fragen haben, wenden Sie sich bitte jetzt an uns.\nSie k�nnen sich die Anleitungen nochmal anschauen. Wenden Sie sich daf�r an den Versuchsleiter.';

%----------------------------------------------------------------------------   
if wintrial
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Zur Berechnung Ihres Gewinnes werden am Ende zuf�llig ein Drittel der Durchg�nge bestimmt. Wie oft Sie in diesen gewonnen haben, ergibt Ihren Gewinn. Deshalb ist jeder Durchgang sehr wichtig, denn jeder kann zuf�llig ausgew�hlt werden. Diesen Gewinn werden Sie im echten Durchgang auch tats�chlich erhalten, in der gleich folgenden �bung nicht.';

else
    
        i=i+1; 
        ypos{i}=yposm;
        tx{i}='Zur Berechnung Ihres �brig gebliebenen Gewinnes (Daher Ihr Anfangsguthaben minus des Verlusts) werden am Ende zuf�llig ein Drittel der Durchg�nge bestimmt. Wie oft Sie in diesen verloren haben, ergibt Ihren Gewinn. Deshalb ist jeder Durchgang sehr wichtig, denn jeder kann zuf�llig ausgew�hlt werden. Diesen Gewinn werden Sie im echten Durchgang auch tats�chlich erhalten, in der gleich folgenden �bung nicht.';
end
%----------------------------------------------------------------------------   
    i=i+1; 
	ypos{i}=yposm;
	tx{i}='Zus�tzlich zu der Aufgabe werden wir Sie manchmal fragen, ob Sie noch v�llig auf die Aufgabe fokussiert sind oder ob Sie an etwas anderes denken und z.B. tagtr�umen.';
    
    i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es ist v�llig in Ordnung, wenn Ihre Gedanken w�hrend der Aufgabe abschweifen. \nWichtig ist nur, dass Sie das bei der Abfrage ehrlich angeben.';
    
    
    i=i+1; 
	ypos{i}=yposm;
	tx{i}='Daf�r �ffnet sich eine Abfrage-Maske bei der Sie mit der Maus einen Regler nach links oder rechts schieben k�nnen und per Mausklick Ihren Wert auf der der Skala ausw�hlen. \nDr�cken Sie die Pfeiltaste, um das einmal zu probieren:';
    
    
    i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 1;for nt = 1:1;SelfStatement;end;getleftrightarrow;';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    i=i+1; 
	ypos{i}=yposm;
	tx{i}='W�hrend des Experiments �ndert sich die Richtung, mit der Sie eine gewisse Antwort geben zuf�llig. \nDas bedeutet, dass Sie in einem Durchlauf m�glicherweise auf der linken Seite angeben, dass Sie fokussiert sind, w�hrend Sie im n�chsten Durchlauf auf der gleichen Seite angeben, dass Ihre Gedanken woanders sind. Beachten Sie das, damit Sie keine falsche angabe machen.';
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    i=i+1; 
	ypos{i}=yposm;
	tx{i}=' Au�erdem ist es wichtig, dass Sie Ihre Antwort so schnell wie m�glich geben. Versuchen Sie das noch einige Male:';
    
    
    i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 1;for nt = 2:4;SelfStatement;end;getleftrightarrow;';

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir m�chten jetzt sicherstellen, dass Sie alles verstanden haben.\nBitte erkl�ren Sie, was Ihre Aufgabe in diesem Spiel ist.\nDr�cken Sie dann die rechte Taste um mit einem �bungsdurchgang zu beginnen. Dieser dauert ca. 9min.';

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% WALL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    wall(i)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
instr_display; 
