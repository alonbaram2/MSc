function PitchDiscriminationExperiment()

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
