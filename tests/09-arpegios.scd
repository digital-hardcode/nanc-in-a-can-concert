(
~canonConfig = (
  baseTempo: 280,
  // baseTempo: 50,
  melody: [
    (dur: 1/8, note: 63),
    (dur: 1, note: 68),
    (dur: 1/4, note: 75),
    (dur: 2, note: 61),
    (dur: 2, note: 73),
    (dur: 2, note: 61),
    (dur: 2, note: 64),
    (dur: 1/4, note: 65),

  ].pyramid.mirror.lace(64),
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



~visualize.(~myCanon);

~myCanon
.canon //we extract the canon from the data structure that is returned
.collect(~instrument.([\dist2,\dist2,\pianola,\dist3,\pianola], amp: 1, repeat: 1)) // we pass each voice into our ~instrument. At this point ~instrument is returning a `MakePbind`, because it has been partially applied with `([Symbol], Amp, Repeat)`. This line will return: `[Pbind, Pbind, Pbind, Pbind]`
.do({|pbind| pbind.play});// finally we play each voice

~myCanon.canon.collect({|canon,index|
    [index].postln;
    // "notas".postln;
    // canon.notes.postln; //we extract the canon from the data structure that is returned
    "duraciones".postln;
    canon.durs.postln; //we extract the canon from the data structure that is returned
})

)
