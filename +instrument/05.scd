(
        ~canonConfig = (
          baseTempo: 33,
          // baseTempo: 50,
          melody: [
            (dur: 1, note: 60-36),
            (dur: 1, note: 60-36),
            (dur: 1, note: 62-36),
            (dur: 1, note: 63-36),
            (dur: 1, note: 65-36),
            (dur: 1, note: 67-36),
            (dur: 1, note: 68-36),
            (dur: 1, note: 70-36),
          // ].pyramid.mirror,
          ].pyramid.lace(48),
          //mirror
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


h = SynthPlayer(\h,\hhClosed);
h.seq(\ampTrig,0, "1:4 0.3x 1.5",[\speed,10]);
h.seq(\ampTrig,1, "1 0.3:4 1.5",[\speed,6]);
h.seq(\ampTrig,2, "1x 0.3xx 1.5xxx",[\speed,2,\repeat,1]);

h.seq(\synthdef, 0, P([\hhOpen, \hhClosed]));
w = SynthPlayer("0",\distPad);
y = SynthPlayer("1",\distPad);
x = SynthPlayer("2",\distPad);
z = SynthPlayer("3",\distPad);

w.speed=4;
y.speed=4;
x.speed=4;
z.speed=4;

w.octave=3;
y.octave=4;
x.octave=4;
z.octave=5;

w.seq(\note,0,a);
y.seq(\note,0,b);
x.seq(\note,0,c);
z.seq(\note,0,d);

)
