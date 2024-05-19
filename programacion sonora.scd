s.boot;

(
SynthDef(\basicSine, {
    |freq = 440, amp = 0.1, dur = 1|
    var env = EnvGen.kr(Env.perc(0.01, dur), doneAction: 2);
    var sig = SinOsc.ar(freq) * env * amp;
    Out.ar(0, sig);
}).add;
)

(
Pdef(\sineSeq, Pbind(
    \instrument, \basicSine,
    \dur, Pseq([0.5, 0.25, 0.75, 1], inf),
    \amp, Pseq([0.1, 0.2, 0.15, 0.1], inf),
    \freq, Pseq([440, 660, 550, 880], inf)
)).play;
)
