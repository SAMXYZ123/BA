 i=0; clear tx ypos func;
 func{1}=[];
 
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir möchten Ihnen jetzt die Aufgabe erklären. Sie können mit der rechten und linken Taste vor- und zurück blättern.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Es geht darum soviel Geld wie möglich zu gewinnen.';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Jeder Durchgang besteht aus zwei aufeinanderfolgenden Entscheidungen. Bei der ersten entscheiden Sie sich zwischen zwei grauen Bildern:'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(1,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Diese Entscheidung führt Sie zu einem farbigen Paar von Bildern, zum Beispiel:'];
	func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Hier führt die Entscheidung für das eine graue Bild\nhäufiger zu dem einen farbigen Paar...'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,1),[],instrall(3,:));Screen(''DrawTexture'',wd,stim(2,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],instrall(2,:)); getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...während die Entscheidung für das andere graue Bild\n häufiger zu dem anderen farbigen Paar führt.'];
	func{i}='Screen(''DrawTexture'',wd,stim(1,2),[],instrall(3,:));Screen(''DrawTexture'',wd,stim(3,1),[],instrall(1,:));Screen(''DrawTexture'',wd,stim(3,2),[],instrall(2,:)); getleftrightarrow;';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Dieser Zusammenhang zwischen einem der grauen Bilder\nund dem häufigeren farbigen Bilderpaar bleibt immer gleich!\n\nEs mischt allerdings der Zufall ein wenig mit, so dass das eine graue Bild nicht immer zu dem häufigeren farbigen Bilderpaar führt und das andere graue Bild auch nicht immer zu dem anderen farbigen Bilderpaar.'];

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer wenn Sie zwei Bilder sehen haben Sie 2 Sekunden Zeit eines der beiden auszuwählen.\n\nDazu drücken Sie bitte die linke Taste  für das linke Bild\nund die rechte Taste für das rechte Bild.'];
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Versuchen Sie das jetzt einige Male:';
	
% Ohne Feedback, ohne Choice 2nd step
i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 1;for nt = 1:4; twosteptrial; end; getleftrightarrow;';

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Wie bereits gesagt, dieser Zusammenhang zwischen der erster Entscheidung und dem häufigeren farbigen Bilderpaar bleibt immer gleich!'];

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Gibt es hierzu bisher Fragen?'];

i=i+1;  
	ypos{i}=yposm;
	tx{i}=['Jetzt werden wir uns mit den farbigen Bilderpaaren beschäftigen und wie Sie tatsächlich Geld gewinnen können.'];
            
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Sie sehen ein farbiges Bilderpaar und entscheiden sich für eines von beiden:'];
    func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));Screen(''DrawTexture'',wd,stim(2,2),[],box(2,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Kurz nach der Entscheidung bekommen Sie eine Rückmeldung. Entweder wird das gewählte Symbol mit 20 Cent belohnt...'];
    func{i}='Screen(''DrawTexture'',wd,outcome(1),[],boxo);[wt]=Screen(wd,''TextBounds'',rew_txt);ypos1=boxo(2)-(1.5*wt(4));[wt]=Screen(wd,''TextBounds'',rew_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,rew_txt,''center'',ypos1,rew_col);DrawFormattedText(wd,rew_cent,''center'',ypos2,rew_col);getleftrightarrow;';
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['...oder Sie erhalten keine Belohnung, also 0 Cent.'];
    func{i}='Screen(''DrawTexture'',wd,outcome(2),[],boxo);[wt]=Screen(wd,''TextBounds'',pun_txt);ypos1=boxo(2)-(1.5*wt(4));[wt]=Screen(wd,''TextBounds'',pun_cent);ypos2=boxo(4)+(1.4*wt(4));DrawFormattedText(wd,pun_txt,''center'',ypos1,pun_col);DrawFormattedText(wd,pun_cent,''center'',ypos2,pun_col);getleftrightarrow;';
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Meistens gewinnen Sie bei einem der Bilder häufiger.'];
    
i=i+1; 
	ypos{i}=ypost;
	tx{i}=['Ein Bild hat zum Beispiel eine Chance von 60% zu gewinnen. Um ein Gefühl hierfür zu entwickeln, werden wir das ausprobieren. Wählen Sie das Bild ein paar mal (indem Sie die linke Taste  drücken).'];
    func{i}='trainprobreward';


i=i+1;
	ypos{i}=ypost;
	tx{i}='Bei anderen Bildern ist die Chance höher oder niedriger und Sie sollen das herausfinden.\n\nSie können jetzt 20 mal zwischen zwei Bildern wählen. Versuchen Sie herauszufinden, welches Bild besser ist. Ob Sie gewinnen oder nicht hängt nur davon ab, welches Bild Sie wählen und nicht etwa davon, ob es rechts oder links erscheint.';
    func{i}='identifybetterstim;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Je öfters Sie dieses Bild gewählt haben, desto öfters haben Sie gewonnen. Sie versuchen immer das beste Bild zu wählen.';
    func{i}='Screen(''DrawTexture'',wd,stim(2,1),[],box(1,:));getleftrightarrow;';
    
i=i+1;
	ypos{i}=ypost;
	tx{i}='Später ist das ein wenig schwieriger:\n\n1) Es gibt zwei farbige Bilderpaare.';
    func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';
	
i=i+1;
	ypos{i}=yposm;
	tx{i}='2) Die Häufigkeit der Gewinne jedes Bildes verändert sich langsam. Ein gutes Bild kann also langsam schlechter und dann wieder besser werden. Das besprechen wir jetzt noch mal genauer.';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Nehmen Sie z.Bsp. wieder das Bild von vorher. Im Beispiel war die Chance zu gewinnen immer 60%.' ;
	func{i}='Screen(''DrawTexture'',wd,instrfig(1),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='In Wirklichkeit könnte es jetzt aber sein, dass ein Bild Anfangs mit hoher Wahrscheinlichkeit gewinnt,';
	func{i}='for k=2:4;Screen(''DrawTexture'',wd,instrfig(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.8);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='aber dann schlechter wird.';
	func{i}='Screen(''DrawTexture'',wd,instrfig(5),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Wenn Sie immer dieses Bild wählen, gewinnen Sie anfangs häufig,';
	func{i}='for k=1:16;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='später aber seltener.';
	func{i}='for k=17:32;Screen(''DrawTexture'',wd,instrfigsamples(k),[],instrfigbox);Screen(''Flip'',wd,[],1);WaitSecs(.05);end;getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Es könnte sein (muss aber nicht!), dass das andere Bild schlecht anfängt, aber dann besser wird.';
	func{i}='Screen(''DrawTexture'',wd,instrfig(6),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Und dass sich das am Ende wieder verändert...';
	func{i}='Screen(''DrawTexture'',wd,instrfig(7),[],instrfigbox);getleftrightarrow;';

i=i+1;
	ypos{i}=yposm;
	tx{i}='In diesem Fall würden Sie am meisten Geld gewinnen, wenn Sie anfangs das eine Bild wählten, dann eine Weile lang zum anderen wechselten, und am Ende wieder zum ersten zurück kommen würden.';

i=i+1;
	ypos{i}=yposm;
	tx{i}='Dies sind aber nur Beispiele. Es sind alle Zeitverläufe möglich, alle Bilder können langsam besser oder schlechter werden.';

i=i+1;
	ypos{i}=yposm;
	tx{i}='Die Veränderungen sind also fast unvorhersagbar. Aber die Veränderungen sind recht langsam. Das heisst, dass ein gutes Bild wahrscheinlich mindestens ein paar Runden weiter gut sein wird und ein mittelmässiges auch ein paar Runden lang mittelmässig bleiben wird.';

i=i+1;
	ypos{i}=ypost;
	tx{i}='Als Zusammenfassung:\n\nEs gibt zwei farbige Bildpaare (blau und pink), die variabel zu Gewinn führen:';
	func{i}='Screen(''DrawTexture'',wd,stimboth(2),[],instrboth(1,:));Screen(''DrawTexture'',wd,stimboth(3),[],instrboth(2,:));getleftrightarrow;';
	
i=i+1;
	ypos{i}=ypost;
	tx{i}='Je nach dem welches der zwei grauen Bilder Sie ausgewählt haben sehen Sie häufiger eines der zwei farbigen Paare:'; 
	func{i}='Screen(''DrawTexture'',wd,stimboth(1),[],instrboth(3,:));getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Sie entscheiden sich also zuerst für eines der grauen Bilder. Darauf folgen entweder zwei blaue oder zwei pinke Bilder. Dann entscheiden Sie sich für eines dieser zwei farbigen Bilder und gewinnen Geld oder nicht.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}=['Immer wenn Sie zwei Bilder sehen haben Sie 2 Sekunden Zeit eines der beiden auszuwählen.\n\nDazu drücken Sie bitte die linke Taste für das linke Bild\nund die rechte Taste für das rechte Bild.'];
    
i=i+1; 
	ypos{i}=yposm;
	tx{i}='Bitte üben Sie diesen Ablauf jetzt einige Male.';

% Jetzt komplett (mit vollständigen 2nd step und feedback)
i=i+1; 
	ypos{i}=ypost;
	func{i}='instr_steps = 0;for nt = 5:8;twosteptrial;end;getleftrightarrow;';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Diese Aufgabe ist schwierig. Sie müssen versuchen herauszufinden, welches der vier farbigen Bilder aktuell am besten ist und diese dann auswählen.\n\nDamit Sie das aktuell beste farbige Bilder überhaupt wählen können,\nmüssen Sie das graue Bild wählen, welches häufiger zu dem entsprechenden farbigen Bilderpaar führt.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wieviel Sie verdienen hängt ein bisschen von Glück ab,\naber vor allem davon, wie gut Sie auswählen.'; 

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Falls Sie noch Fragen haben, wenden Sie sich bitte jetzt an uns.\nSie können auch mit der linken Taste zurückblättern und sich die Anleitungen nochmals anschauen.';

i=i+1; 
	ypos{i}=yposm;
	tx{i}='Wir möchten jetzt sicher stellen, dass Sie alles verstanden haben.\nBitte erklären Sie dem Versuchsleiter, was Ihre Aufgabe rist.\nDrücken Sie dann die rechte Taste um mit einem Übungsdurchgang zu beginnen. Dieser dauert ca. 9min.';

instr_display;

