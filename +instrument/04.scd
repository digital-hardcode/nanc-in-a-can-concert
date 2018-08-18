(
    ~canonConfig = (
      baseTempo: 222,
      // baseTempo: 50,
      melody: [
        (dur: 1, note: 60-48),
        (dur: 1, note: 63-48),
        (dur: 1/4, note: 62-48),
        (dur: 2, note: 60-48),
        (dur: 1/4, note: 67-48),
        (dur: 1/16, note: 72-48),
        (dur: 1/8, note: 68-48),
        (dur: 1/8, note: 65-48),
        (dur: 1, note: 75-48),
        (dur: 1, note: 70-48),
        (dur: 1, note: 74-48),
      ].pyramid.mirror.lace(96),
      // ].pyramid.mirror.pyramid,
      voices: [ // Note that voices and tempos should be arrays of the same size
        (transp: 0, amp: 0.5),
        (transp: 7, amp: 0.25),
        (transp: -12, amp: 2),
        (transp: -24, amp: 1),
        (transp: 12, amp: 0.1),
      ],
      tempos: [
        (tempo: 50,  percentage: 20),
        (tempo: 400,  percentage: 20),
        (tempo: 100, percentage: 20),
        (tempo: 200, percentage: 20),
        (tempo: 150, percentage: 20),
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
k.seq(\ampTrig,1, "1 0.3 1.5",[\speed,8]);
h = SynthPlayer(\h,\hhClosed);
h.seq(\ampTrig,0, "1:4 0.3x 1.5",[\speed,8]);
h.seq(\ampTrig,1, "1 0.3:4 1.5",[\speed,4]);
h.seq(\ampTrig,2, "1x 0.3xx 1.5xxx",[\speed,2,\repeat,1]);

h.seq(\synthdef, 0, P([\hhOpen, \hhClosed]));
w = SynthPlayer("0",\distPad);
y = SynthPlayer("1",\distPad);
x = SynthPlayer("2",\distPad2);
z = SynthPlayer("3",\distPad3);

w.speed=1/2;
y.speed=1/2;
x.speed=1/2;
z.speed=1/2;

w.octave=3;
y.octave=4;
x.octave=4;
z.octave=4;

w.seq(\note,0,a);
y.seq(\note,0,b);
x.seq(\note,0,c);
z.seq(\note,0,d);

)
