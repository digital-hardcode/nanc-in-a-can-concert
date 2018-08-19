(

~canonConfig = (
  baseTempo: 600,
  melody: [
    (dur: 1, note: 60-36),
    (dur: 1, note: 60-36),
    (dur: 1/2, note: 62-36),
    (dur: 1, note: 63-36),
    (dur: 1/2, note: 65-36),
    (dur: 1, note: 61-36),
    (dur: 1, note: 67-36),
    (dur: 1/2, note: 68-36),
    (dur: 1, note: 70-36),
  ].pyramid.mirror.pyramid,
  // ].pyramid.mirror.pyramid,
  voices: [ // Note that voices and tempos should be arrays of the same size
    (transp: 0, amp: 0.75),
    (transp: -7, amp: 0.55),
    (transp: -12, amp: 0.8),
    (transp: -24, amp: 1)
  ],
  tempos: [
    (tempo: 50,  percentage: 25),
    (tempo: 400,  percentage: 25),
    (tempo: 100, percentage: 25),
    (tempo: 200, percentage: 25)
  ]
);

~myCanon = ~divCanon.(~canonConfig);


// ~visualize.(~myCanon);



// ~visualize.(~myCanon);



i=INSTRUMENT.new;

k = SynthPlayer(\k,\kickElectro);
k.seq(\ampTrig,0,"2 0.8",[\speed,2]);
n = SynthPlayer(\s,\snare1);
n.seq(\ampTrig,0,[\r,\r,\r,2,\,2,\r,0.3].pyramid,[\speed,4.5]);
h = SynthPlayer(\h,\hh2);
h.seq(\ampTrig,0,"0.1x  1xx 0.8",[\speed,3,\repeat,2]);
h.seq(\ampTrig,0,"0.1x  1xx 0.8",[\speed,4.5]);
h.seq(\ampTrig,1,"1 0.8",[\speed,9,\repeat,8]);

a=i.sequencer.makeCanonVoice(~myCanon.canon[0]);
b=i.sequencer.makeCanonVoice(~myCanon.canon[1]);
c=i.sequencer.makeCanonVoice(~myCanon.canon[2]);
d=i.sequencer.makeCanonVoice(~myCanon.canon[3]);

w = SynthPlayer("0",\tranceBazz);
y = SynthPlayer("1",\tranceBazz2);
x = SynthPlayer("2",\tranceBazz);
z = SynthPlayer("3",\tranceBazz2);

w.speed=1/2;
y.speed=1/2;
x.speed=1/2;
z.speed=1/2;

w.octave=3;
y.octave=2;
x.octave=3;
z.octave=4;

w.seq(\note,0,a, [\waitBefore, ~myCanon.canon[0].onset, \repeat, 1 ]);
y.seq(\note,0,b, [\waitBefore, ~myCanon.canon[1].onset, \repeat, 1 ]);
x.seq(\note,0,c, [\waitBefore, ~myCanon.canon[2].onset, \repeat, 1 ]);
z.seq(\note,0,d, [\waitBefore, ~myCanon.canon[3].onset, \repeat, 1 ]);


w.seq(\note,1, [\r], [\repeat,1000]);
y.seq(\note,1, [\r], [\repeat,1000]);
x.seq(\note,1, [\r], [\repeat,1000]);
z.seq(\note,1, [\r], [\repeat,1000]);
//
// w.seq(\synthdef,0,P([\pianola, \r, \r, \dist ].rotate(0)),[\speed,1/1]);
// y.seq(\synthdef,0,P([\pianola, \r, \distPad, \dist ].rotate(1)),[\speed,1/2]);
// x.seq(\synthdef,0,P([\pianola, \r, \r, \distPad2, \r, \dist ].rotate(2)),[\speed,1/3]);
// z.seq(\synthdef,0,P([\pianola, \tranceBazz, \r, \dist ].rotate(3)),[\speed,1/4]);
//
// w.seq(\fx,0,P([\delay1,\reverb,\delay2]),[\speed,1/1]);
// y.seq(\fx,0,P([\delay1,\reverb,\delay2]),[\speed,1/2]);
// x.seq(\fx,0,P([\delay1,\reverb,\delay2]),[\speed,1/3]);
// z.seq(\fx,0,P([\delay1,\reverb,\delay2]),[\speed,1/4]);


)
