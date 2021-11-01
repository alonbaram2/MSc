function isCorrect = RunPitchDiscriminationTrial(fLow, fHigh)
    
randomOrder = randperm(2);
if randomOrder(1) == 1
	PlayPureTone(fLow);
	pause(0.2)
	PlayPureTone(fHigh); 
elseif randomOrder(1) == 2
	PlayPureTone(fHigh);
	pause(0.2)
	PlayPureTone(fLow); 
end

response = input('Which tone was lower frequency, first (1) or second (2)? ');

if response == randomOrder(1)
	isCorrect = 1;
else
	isCorrect = 0;
end

pause(0.5)

