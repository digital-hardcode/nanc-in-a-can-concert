(
~canonConfig = (
  cp: 20,
  melody: [
    (dur: 1.5, note: 52-48),
    (dur: 1/4, note: 62-48),
    (dur: 1/2, note: 54-48),
    (dur: 1, note: 59-48),
    (dur: 1/2, note: 62-48),
    (dur: 1/2, note: 71-48),
    (dur: 1/4, note: 66-48),
    (dur: 1/4, note: 67-48),
    (dur: 1/4, note: 62-48),
    (dur: 1/2, note: 69-48),
  ].lace(6).pyramid,
  voices: [
    (tempo: 120, transp: 0+12),
    (tempo: 120*2, transp: 12+12),
    (tempo: 120*0.75, transp: 7+12),
    (tempo: 120/1.5, transp: -12+12),
    (tempo: 120+3, transp: 12+12),
    (tempo: 120-3, transp: 19+12),
    (tempo: 120*0.5, transp: 5+12),
    (tempo: 120*1.25, transp: 24+12),
    (tempo: 120*0.75, transp: 17+12),
    (tempo: 120*1.5, transp: 36+12)
  ]
);

~myCanon = ~convCanon.(~canonConfig);


i=INSTRUMENT.new;

a=i.sequencer.makeCanonVoice(~myCanon.canon[0]);
b=i.sequencer.makeCanonVoice(~myCanon.canon[1]);
c=i.sequencer.makeCanonVoice(~myCanon.canon[2]);
d=i.sequencer.makeCanonVoice(~myCanon.canon[3]);

k = SynthPlayer(\k,\kickElectro);
k.seq(\ampTrig,0, "1 0.3 1.5",[\speed,4]);
h = SynthPlayer(\h,\hhClosed);
h.seq(\ampTrig,0, "1 0.3x 1.5",[\speed,8]);
h.seq(\ampTrig,1, "1 0.3 1.5",[\speed,4]);
h.seq(\ampTrig,2, "1x 0.3xx 1.5xxx",[\speed,2,\repeat,1]);

h.seq(\synthdef, 0, P([\hhOpen, \hhClosed]));
w = SynthPlayer("0",\distPad);
y = SynthPlayer("1",\distPad);
x = SynthPlayer("2",\distPad2);
z = SynthPlayer("3",\distPad3);

i.play;
w.speed=1/2;
y.speed=1/2;
x.speed=1/2;
z.speed=1/2;

w.octave=2;
y.octave=2;
x.octave=2;
z.octave=2;

w.seq(\note,0,a);
y.seq(\note,0,b);
x.seq(\note,0,c);
z.seq(\note,0,d);

)
