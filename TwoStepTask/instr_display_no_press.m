if length(func)<i;func{i}=[];end
Pages=i;
page=1;

for page = page:Pages
    DrawFormattedText(wd,tx{page},'center',ypos{page},txtcolor, TotalCharacterWrap,[],[],1.3);
    T.onset_payment = Screen('Flip',wd);
    %Screen('Flip',wd);
    WaitSecs(6-monitorFlipInterval);         
end




