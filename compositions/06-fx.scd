(

    ~canonConfig = (
      baseTempo: 280,
      // baseTempo: 50,
      melody: [
        (dur: 1/8, note: 63-36),
        (dur: 1, note: 68-36),
        (dur: 1/4, note: 75-36),
        (dur: 2, note: 61-36),
        (dur: 2, note: 73-36),
        (dur: 2, note: 61-36),
        (dur: 2, note: 64-36),
        (dur: 1/4, note: 65-36),

      ].pyramid.mirror.lace(256),
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

w = SynthPlayer("0",\pianola);
y = SynthPlayer("1",\pianola);
x = SynthPlayer("2",\pianola);
z = SynthPlayer("3",\pianola);

w.speed=4;
y.speed=4;
x.speed=4;
z.speed=4;

w.octave=2;
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


w.seq(\synthdef,0,P([\pianola, \r, \r, \dist ].rotate(0)),[\speed,1/1]);
y.seq(\synthdef,0,P([\pianola, \r, \distPad, \dist ].rotate(1)),[\speed,1/2]);
x.seq(\synthdef,0,P([\pianola, \r, \r, \distPad2, \r, \dist ].rotate(2)),[\speed,1/3]);
z.seq(\synthdef,0,P([\pianola, \tranceBazz, \r, \dist ].rotate(3)),[\speed,1/4]);


w.createFx(\reverb);
y.createFx(\reverb);
x.createFx(\reverb);
z.createFx(\reverb);

w.seq(\fx,0,P([\revlpf,\reverb,\delay1,\reverb,\revlpf,\distortion,\delay2]),[\speed,1/2]);
y.seq(\fx,0,P([\revlpf,\reverb,\delay1,\revlpf,\reverb,\delay2]),[\speed,1/3]);
x.seq(\fx,0,P([\revlpf,\reverb,\resonz,\delay1,\reverb,\delay3,\delay2]),[\speed,1/4]);
z.seq(\fx,0,P([\revlpf,\reverb,\delay1,\reverb,\moogFF,\delay3,\delay2]),[\speed,1/6]);


)
