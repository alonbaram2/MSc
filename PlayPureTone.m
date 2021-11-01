function PlayPureTone(f)
% Plays a pure tone at the specified auditory frequency

% f = frequency in Hz
% f should be between 100 and 2400 
% (sounds outside this range will not be accurately reproduced)

% To avoid nasty transients at the start and end of the tone, the sound is
% ramped on and off. The ramp duration and the total duration is specified in the function.
% The sample rate for the sound card is specified in the function.

theSampleRate = 8000;               % samples per second
totalDuration = 0.8;                % duration in seconds
riseTime = 0.1;                     % rise and fall time for the smooth envelope
N = totalDuration*theSampleRate; 	% number of samples in total
n = riseTime*theSampleRate;         % number of samples in rise and fall

t = 1:N;                                    % set up samples for the complete sound
fTone = f ./ totalDuration;                 % calculate the number of cycles in the specified duration
tone = sin(2*pi*fTone*t/theSampleRate);     % generate the sinusoidal tone

t = 1:n;                                    % set up samples for the ramped period
fRise = 0.25 ./ riseTime;                   % 1/4 of a sinewave gives a smooth, rising ramp
rise = sin(2*pi*fRise*t/theSampleRate);     % generate the ramp
smoothEnvelope = [rise ones(1, N-2*n) rise(end:-1:1)];  % concatenate a rising ramp, a steady state piece, and a falling ramp

theAudioSignal = smoothEnvelope .* tone;

myAudioplayerObject = audioplayer(theAudioSignal, theSampleRate);
playblocking(myAudioplayerObject)

