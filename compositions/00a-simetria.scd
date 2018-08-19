(

    ~canonConfig = (
      baseTempo: 600,
      melody: [
        (dur: 1, note: 60-36),
        (dur: 1/2, note: 60-36),
        (dur: 1/3, note: 62-36),
        (dur: 1/4, note: 63-36),
        (dur: 1/4, note: 65-36),
        (dur: 1/4, note: 67-36),
        (dur: 1/4, note: 68-36),
        (dur: 1/4, note: 70-36),
      ].pyramid.mirror,
      // ].pyramid.mirror.pyramid,
      voices: [ // Note that voices and tempos should be arrays of the same size
        (transp: 0, amp: 0.5),
        (transp: 7, amp: 0.5),
        (transp: -12, amp: 0.8),
        (transp: -24, amp: 0.2)
      ],
      tempos: [
        (tempo: 100,  percentage: 25),
        (tempo: 50,  percentage: 25),
        (tempo: 150, percentage: 25),
        (tempo: 2000, percentage: 25)
      ]
    );

    ~myCanon = ~divCanon.(~canonConfig);


~visualize.(~myCanon);

i=INSTRUMENT.new;
// v = List.new;

z=List.new;

~synths=[\dist,\dist,\dist,\tranceBazz];
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
