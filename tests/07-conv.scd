(
~canonConfig = (
  cp: 44,
  melody: [
  (dur: 1, note: 55),
  (dur: 1/32, note: 63),
  (dur: 1/32, note: 62),
  (dur: 1/32, note: 63),
  (dur: 1/32, note: 65),
  (dur: 1/32, note: 67),
  (dur: 1/32, note: 68),
  (dur: 1/32, note: 70),
  (dur: 1/32, note: 61),
  (dur: 1/32, note: 65),
  ].pyramid.lace(60),
  voices: [
    (tempo: 70, transp: 0),
    (tempo: 65, transp: -12),
    (tempo: 57, transp: 10),
    (tempo: 43, transp: 7),

  ]
);
~myCanon = ~convCanon.(~canonConfig);

~visualize.(~myCanon);


~myCanon
.canon //we extract the canon from the data structure that is returned
.collect(~instrument.([\dist2,\dist2], amp: 1, repeat: 2)) // we pass each voice into our ~instrument. At this point ~instrument is returning a `MakePbind`, because it has been partially applied with `([Symbol], Amp, Repeat)`. This line will return: `[Pbind, Pbind, Pbind, Pbind]`
.do({|pbind| pbind.play});// finally we play each voice

)
