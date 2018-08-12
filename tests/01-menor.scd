(
~canonConfig = (
  baseTempo: 60,
  melody: [
    (dur: 1, note: 60),
    (dur: 1/2, note: 60),
    (dur: 1/3, note: 62),
    (dur: 1/4, note: 63),
    (dur: 1/4, note: 65),
    (dur: 1/4, note: 67),
    (dur: 1/4, note: 68),
    (dur: 1/4, note: 70),
  ].pyramid.mirror,
  voices: [ // Note that voices and tempos should be arrays of the same size
    (transp: 0, amp: 0.5),
    (transp: 7, amp: 0.25),
    (transp: -12, amp: 2),
    (transp: -24, amp: 1)
  ],
  tempos: [
    (tempo: 100,  percentage: 20),
    (tempo: 50,  percentage: 30),
    (tempo: 150, percentage: 10),
    (tempo: 200, percentage: 40)
  ]
);

~myCanon = ~divCanon.(~canonConfig);


~visualize.(~myCanon);

~myCanon
.canon //we extract the canon from the data structure that is returned
.collect(~instrument.([\distPad,\distPad2,\distPad3], amp: 1, repeat: 2)) // we pass each voice into our ~instrument. At this point ~instrument is returning a `MakePbind`, because it has been partially applied with `([Symbol], Amp, Repeat)`. This line will return: `[Pbind, Pbind, Pbind, Pbind]`
.do({|pbind| pbind.play});// finally we play each voice

)
