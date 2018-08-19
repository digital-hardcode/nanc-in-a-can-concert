(
    ~canonConfig = (
  baseTempo: 200,
  melody: [
    (dur: 1, note: 60-48),
    (dur: 1, note: 60-48),
    (dur: 1/2, note: 62-48),
    (dur: 1, note: 63-48),
    (dur: 1/2, note: 65-48),
    (dur: 1, note: 61-48),
    (dur: 1, note: 67-48),
    (dur: 1/2, note: 68-48),
    (dur: 1, note: 70-48),
  ].pyramid,
  // ].pyramid.mirror.pyramid,
  voices: [ // Note that voices and tempos should be arrays of the same size
    (transp: 0, amp: 0.5),
    (transp: 7, amp: 0.35),
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

w.speed=2;
y.speed=2;
x.speed=2;
z.speed=2;

w.seq(\note,0,a, [\repeat,1,\waitBefore,~myCanon.canon[0].onset] );
y.seq(\note,0,b, [\repeat,1,\waitBefore,~myCanon.canon[1].onset] );
x.seq(\note,0,c, [\repeat,1,\waitBefore,~myCanon.canon[2].onset] );
z.seq(\note,0,d, [\repeat,1,\waitBefore,~myCanon.canon[3].onset] );

w.seq(\note,1, [\r], [\repeat,1000]);
y.seq(\note,1, [\r], [\repeat,1000]);
x.seq(\note,1, [\r], [\repeat,1000]);
z.seq(\note,1, [\r], [\repeat,1000]);
)
