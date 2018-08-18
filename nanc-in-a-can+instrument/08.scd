(
~canonConfig = (
  cp: 44,
  melody: [
    (dur: 1, note: 60-36),
    (dur: 1, note: 62-36),
    (dur: 1, note: 63-36),
    (dur: 1, note: 65-36),
    (dur: 1, note: 63-36),
    (dur: 1, note: 67-36),
    (dur: 1, note: 68-36),
    (dur: 1, note: 70-36),
    (dur: 1, note: 65-36),
    (dur: 1, note: 75-36),
    (dur: 1, note: 74-36),
  ].lace(44),
  voices: [
    (tempo: 320, transp: 0),
    (tempo: 320*4, transp: 12),
    (tempo: 320*0.75, transp: -12),
    (tempo: 320*1.5, transp: 12)
  ]
);
~myCanon = ~convCanon.(~canonConfig);


~visualize.(~myCanon);



i=INSTRUMENT.new;

a=i.sequencer.makeCanonVoice(~myCanon.canon[0]);
b=i.sequencer.makeCanonVoice(~myCanon.canon[1]);
c=i.sequencer.makeCanonVoice(~myCanon.canon[2]);
d=i.sequencer.makeCanonVoice(~myCanon.canon[3]);

w = SynthPlayer("0",\dist);
y = SynthPlayer("1",\dist2);
x = SynthPlayer("2",\dist3);
z = SynthPlayer("3",\dist4);

w.speed=1.35;
y.speed=1.35;
x.speed=1.35;
z.speed=1.35;

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
