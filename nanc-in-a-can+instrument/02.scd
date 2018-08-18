(
~canonConfig = (
  cp: 21,
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
    (tempo: 120-3, transp: 19+12),
    (tempo: 120*1.25, transp: 24+12),
    (tempo: 120*0.75, transp: 17+12),
    (tempo: 120*1.5, transp: 36+12)
  ]
);

~myCanon = ~convCanon.(~canonConfig);

~visualize.(~myCanon);

i=INSTRUMENT.new;
// v = List.new;

z=List.new;


~myCanon.canon.collect({|voice,j|

    var player = SynthPlayer(j.asString,\distPad);
    player.postln;
    player.speed = 1;
    player.octave = 3;
    player.seq(\note,0,i.sequencer.makeCanonVoice(voice), [\repeat,1,\waitBefore,voice.onset]);
    player.seq(\note,1, [\r], [\repeat,1000]);

    voice

});

k = SynthPlayer(\k,\kickElectro);
k.seq(\ampTrig,0, "0.5 0.3 1",[\speed,4,\repeat,12]);
k.seq(\ampTrig,1, "0.5xx  0.3:1/2xx 1",[\speed,4,\repeat,4]);
k.seq(\ampTrig,2, "0.5  0.3 1xx  0.75",[\speed,8]);
h = SynthPlayer(\h,\hhClosed);
h.seq(\ampTrig,0, "0.5 0.3x 0.75",[\speed,8]);
h.seq(\ampTrig,1, "0.5 0.3 0.75",[\speed,4]);
h.seq(\ampTrig,2, "0.5x 0.3xx 0.75xxx",[\speed,2,\repeat,1]);
h.seq(\synthdef, 0, P([\hhOpen, \hhClosed]));




)
