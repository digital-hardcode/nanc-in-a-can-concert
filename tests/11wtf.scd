(
    ~canonConfig = (
  baseTempo: 200,
  melody: [
    (dur: 1, note: 60),
    (dur: 1, note: 60),
    (dur: 1/2, note: 62),
    (dur: 1, note: 63),
    (dur: 1/2, note: 65),
    (dur: 1, note: 61),
    (dur: 1, note: 67),
    (dur: 1/2, note: 68),
    (dur: 1, note: 70),
  ].pyramid,
  // ].pyramid.mirror.pyramid,
  voices: [ // Note that voices and tempos should be arrays of the same size
    (transp: 0, amp: 0.5),
    (transp: 7, amp: 0.25),
    (transp: -12, amp: 2),
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


i=INSTRUMENT.new;

a=i.sequencer.makeCanonVoice(~myCanon.canon[0]);
b=i.sequencer.makeCanonVoice(~myCanon.canon[1]);
c=i.sequencer.makeCanonVoice(~myCanon.canon[2]);
d=i.sequencer.makeCanonVoice(~myCanon.canon[3]);

k = SynthPlayer(\k,\kickElectro);
k.seq(\ampTrig,0, "1 0.3 1.5",[\speed,4]);
k.kill
w = SynthPlayer("0",\dist);
y = SynthPlayer("1",\dist);
x = SynthPlayer("2",\dist);
z = SynthPlayer("3",\dist);


y.seq(\test,0,"23 12 12 12 12",[\speed,4]);
w.speed=1/2;
y.speed=1/2;
x.speed=1/2;
z.speed=1/2;

w.seq(\note,0,a);
y.seq(\note,0,b);
x.seq(\note,0,c);
z.seq(\note,0,d);

)
