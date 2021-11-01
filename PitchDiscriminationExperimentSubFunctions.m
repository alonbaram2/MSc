function PitchDiscriminationExperimentSubFunctions

fA = input('Please specify frequency A in Hz: ');
fB = input('Please specify frequency B in Hz: ');

if fA <= fB
    if fA == fB
        disp('Warning: Both frequencies are the same');
    end
    fLow = fA;
    fHigh = fB;
else
    fLow = fB;
    fHigh = fA;
end

numTrials = 10;
numCorrect = 0;

for i = 1:numTrials
	isCorrect = RunPitchDiscriminationTrial(fLow, fHigh);
    numCorrect = numCorrect + isCorrect;
end

propCorrect = numCorrect / numTrials;

disp(['Congratulations: You got ' num2str(100 * propCorrect) '% correct.']);

%------------------------------------------
%------------------------------------------
function isCorrect = RunPitchDiscriminationTrial(fLow, fHigh)

randomOrder = randperm(2);
if randomOrder(1) == 1
	PlayTone(fLow);
	pause(0.2)
	PlayTone(fHigh); 
else
	PlayTone(fHigh);
	pause(0.2)
	PlayTone(fLow); 
end

response = input('Which tone was lower frequency, first (1) or second (2)? ');

if response == randomOrder(1)
	isCorrect = 1;
else
	isCorrect = 0;
end

pause(0.5)

%------------------------------------------
%------------------------------------------
function PlayTone(f)
% f = frequency in Hz

s = 8000; 	% sampling rate
d = 0.8; 	% duration
n = d*s; 	% number of samples
t = 1:n;
tone = sin(2*pi*f*t/s);
wavplay(tone, s);
%------------------------------------------
%------------------------------------------
