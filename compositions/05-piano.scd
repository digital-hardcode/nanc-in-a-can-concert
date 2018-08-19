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
            (transp: -5, amp: 1)
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
k.seq(\ampTrig,0, "1 0.75",[\speed,1/4]);
k.seq(\ampTrig,1, "1.3 1xxx",[\speed,1/2]);
k.seq(\ampTrig,2, "1xx:1/2 0.75",[\speed,1/4]);
k.seq(\ampTrig,3, "1:4 0.75 1:1/2xx ",[\speed,1/8,\repeat,1]);
k.seq(\synthdef,0,[\kickDeep,\kickSimple,\kickSyn1,\kickSyn2,\kickSyn3],[\speed,1/3]);
k.createFx(\reverb);
k.seq(\fx,0,[\revlpf,\reverb,\reverb,\reverb,\delay1,\delay2,\delay3].scramble,[\speed,1/2]);

h = SynthPlayer(\h,\hhClosed);
h.seq(\ampTrig,0, "1:4 0.3x 0.75",[\speed,10]);
h.seq(\ampTrig,1, "1 0.3:4 0.75",[\speed,6]);
h.seq(\ampTrig,2, "1x 0.3xx 0.75xxx",[\speed,2,\repeat,1]);
h.seq(\ampTrig,3, "1:4 0.3x .5",[\speed,4]);
h.seq(\ampTrig,4, "1 0.3:4 .5",[\speed,3,\repeat,1]);
h.seq(\ampTrig,5, "1x 0.3xx .5xxx",[\speed,8,\repeat,2]);
h.seq(\ampTrig,6, "1x 0.3xx .5xxx 1xxx:1/4",[\speed,16,\repeat,8]);
h.seq(\synthdef, 0, P([\hhOpen, \hhClosed]));
h.speed=1/2;
h.createFx(\revlpf);
h.seq(\fx,0,[\revlpf,\reverb,\reverb,\reverb,\delay1,\delay2,\delay3]);


w = SynthPlayer("0",\dist2);
y = SynthPlayer("1",\dist3);
x = SynthPlayer("2",\dist4);
z = SynthPlayer("3",\distRing);

w.speed=4;
y.speed=4;
x.speed=4;
z.speed=4;

w.octave=3;
y.octave=4;
x.octave=4;
z.octave=5;

w.seq(\note,0,a, [\repeat,1,\waitBefore,~myCanon.canon[0].onset] );
y.seq(\note,0,b, [\repeat,1,\waitBefore,~myCanon.canon[1].onset] );
x.seq(\note,0,c, [\repeat,1,\waitBefore,~myCanon.canon[2].onset] );
z.seq(\note,0,d, [\repeat,1,\waitBefore,~myCanon.canon[3].onset] );

w.seq(\note,1, [\r], [\repeat,1000]);
y.seq(\note,1, [\r], [\repeat,1000]);
x.seq(\note,1, [\r], [\repeat,1000]);
z.seq(\note,1, [\r], [\repeat,1000]);


)
