Screen('Preference', 'SkipSyncTests', 1);
[win, winRect] = Screen('OpenWindow', 0, [0 0 0]);
[Xo, Yo] = RectCenter(winRect);

AG_800px = imread("AG_800px.jpg");
AG_400px = imresize(AG_800px,.5);
AG = Screen('MakeTexture', win, AG_400px);

BC_800px = imread("BC_800px.jpg");
BC_400px = imresize(BC_800px,.5);
BC = Screen('MakeTexture', win, BC_400px);

results = '';

first_q = randi(2);

if first_q == 1 %%% AG FIRST
    DrawFormattedText(win,'Is Al Gore trustworthy? Y/N','center',Yo+300,[255 255 255]);
    Screen('DrawTexture',win,AG)
    Screen('Flip', win)
    
    stimOnsetTime = GetSecs();
    while (GetSecs() - stimOnsetTime) < 10
       [~, ~, whichKey] = KbCheck();
       if whichKey(89) % KbName('y') == 89
           results = append(results,'y');
           break
       elseif whichKey(78) %KbName('n') == 78
           results = append(results,'n');
           break
       end
    end
    
    DrawFormattedText(win,'Is Bill Clinton trustworthy? Y/N','center',Yo+300,[255 255 255]);
    Screen('DrawTexture',win,BC)
    Screen('Flip', win)
    WaitSecs(1);
    
    stimOnsetTime2 = GetSecs();
    while (GetSecs() - stimOnsetTime2) < 10
       [~, ~, whichKey] = KbCheck();
       if whichKey(89) % KbName('y') == 89
           results = append(results,'y');
           break
       elseif whichKey(78) %KbName('n') == 78
           results = append(results,'n');
           break
       end
end

else %%% BC FIRST
    DrawFormattedText(win,'Is Bill Clinton trustworthy? Y/N','center',Yo+300,[255 255 255]);
    Screen('DrawTexture',win,BC)
    Screen('Flip', win)

    stimOnsetTime = GetSecs();
    while (GetSecs() - stimOnsetTime) < 10
       [~, ~, whichKey] = KbCheck();
       if whichKey(89) % KbName('y') == 89
           results = append(results,'y');
           break
       elseif whichKey(78) %KbName('n') == 78
           results = append(results,'n');
           break
       end
    end
    
    DrawFormattedText(win,'Is Al Gore trustworthy? Y/N','center',Yo+300,[255 255 255]);
    Screen('DrawTexture',win,AG)
    Screen('Flip', win)
    WaitSecs(1);

    stimOnsetTime2 = GetSecs();
    while (GetSecs() - stimOnsetTime2) < 10
       [~, ~, whichKey] = KbCheck();
       if whichKey(89) % KbName('y') == 89
           results = append(results,'y');
           break
       elseif whichKey(78) %KbName('n') == 78
           results = append(results,'n');
           break
       end
    end
    
end

Screen('CloseAll');

id = randi(4294967295); %random id, uint32
fnm = sprintf('%d%d.txt', first_q, id);
fid = fopen(fnm,'w');
fprintf(fid, results);
fclose(fid);