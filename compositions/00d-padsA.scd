(
~canonConfig = (
  cp: 20,
  melody: [
    (dur: 1.5, note: 52-36),
    (dur: 1/4, note: 62-36),
    (dur: 1/2, note: 54-36),
    (dur: 1, note: 59-36),
    (dur: 1/2, note: 62-36),
    (dur: 1/2, note: 71-36),
    (dur: 1/4, note: 66-36),
    (dur: 1/4, note: 67-36),
    (dur: 1/2, note: 69-36),
  ].lace(6).pyramid,
  voices: [
    (tempo: 120, transp: 0),
    (tempo: 120*2, transp: 12),
    (tempo: 120*0.75, transp: 7),
    (tempo: 120/1.5, transp: -12)
  ]
);

~myCanon = ~convCanon.(~canonConfig);


~visualize.(~myCanon);

i=INSTRUMENT.new;
// v = List.new;

z=List.new;
~synths=[\distPad,\distpad2,\distPad2,\distPad3];

~myCanon.canon.collect({|voice,j|

    var player = SynthPlayer(j.asString,~synths[j%~synths.size]);
    player.postln;
    player.speed = 1;
    player.octave = 3;
    player.seq(\note,0,i.sequencer.makeCanonVoice(voice), [\repeat,1,\waitBefore,voice.onset]);
    player.seq(\note,1, [\r], [\repeat,1000]);

    voice

});




)
