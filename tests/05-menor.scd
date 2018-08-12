(
~canonConfig = (
  baseTempo: 600,
  melody: [
    (dur: 1, note: 60),
    (dur: 1, note: 60),
    (dur: 1, note: 62),
    (dur: 1, note: 63),
    (dur: 1, note: 65),
    (dur: 1, note: 61),
    (dur: 1, note: 67),
    (dur: 1, note: 68),
    (dur: 1, note: 70),
  ].pyramid.mirror.pyramid,
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


~visualize.(~myCanon);

~myCanon
.canon //we extract the canon from the data structure that is returned
.collect(~instrument.([\dist,\dist3], amp: 1, repeat: 2)) // we pass each voice into our ~instrument. At this point ~instrument is returning a `MakePbind`, because it has been partially applied with `([Symbol], Amp, Repeat)`. This line will return: `[Pbind, Pbind, Pbind, Pbind]`
.do({|pbind| pbind.play});// finally we play each voice

)
