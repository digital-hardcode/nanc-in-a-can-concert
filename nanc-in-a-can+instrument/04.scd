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
      ].pyramid.mirror.lace(60),
      // ].pyramid.mirror.pyramid,
      voices: [ // Note that voices and tempos should be arrays of the same size
        (transp: 0, amp: 0.75),
        (transp: 7, amp: 0.5),
        (transp: -5, amp: 1.5),
        (transp: -12, amp: 1),
        (transp: 19, amp: 0.4),
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


~synths = [\dist,\dist2,\dist3,\dist4];

~myCanon.canon.collect({|voice,j|

    var player = SynthPlayer(j.asString,~synths[j%~synths.size]);
    player.postln;
    player.speed = 1;
    player.octave = 3;
    player.seq(\note,0,i.sequencer.makeCanonVoice(voice), [\repeat,1,\waitBefore,voice.onset]);
    player.seq(\note,1, [\r], [\repeat,1000]);

    voice

});


//
// k = SynthPlayer(\k,\kickElectro);
// k.seq(\ampTrig,0, "1 0.75",[\speed,4]);
// k.seq(\ampTrig,1, "1.3 1xxx",[\speed,2]);
// k.seq(\ampTrig,2, "1xx:1/2 0.75",[\speed,8]);
// k.seq(\ampTrig,3, "1:4 0.75 1:1/2xx ",[\speed,8,\repeat,1]);
//
// k.seq(\synthdef,0,[\kickSyn1,\kickSyn2,\kickSyn3]);
// h = SynthPlayer(\h,\hhClosed);
// h.seq(\ampTrig,0, "1:4 0.3x .5",[\speed,4]);
// h.seq(\ampTrig,1, "1 0.3:4 .5",[\speed,3,\repeat,1]);
// h.seq(\ampTrig,2, "1x 0.3xx .5xxx",[\speed,8,\repeat,2]);
// h.seq(\synthdef, 0, P([\hhOpen, \hhClosed]));



)
