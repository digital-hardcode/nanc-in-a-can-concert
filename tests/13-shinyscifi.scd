(
~canonConfig = (
  cp: 20,
  melody: [
    (dur: 1.5, note: 52),
    (dur: 1/4, note: 62),
    (dur: 1/2, note: 54),
    (dur: 1, note: 59),
    (dur: 1/2, note: 62),
    (dur: 1/2, note: 71),
    (dur: 1/4, note: 66),
    (dur: 1/4, note: 67),
    (dur: 1/4, note: 62),
    (dur: 1/2, note: 69),
  ].lace(6).pyramid,
  voices: [
    (tempo: 120, transp: 0+12),
    (tempo: 120*2, transp: 12+12),
    (tempo: 120*0.75, transp: 7+12),
    (tempo: 120/1.5, transp: -12+12),
    (tempo: 120+3, transp: 12+12),
    (tempo: 120-3, transp: 19+12),
    (tempo: 120*0.5, transp: 5+12),
    (tempo: 120*1.25, transp: 24+12),
    (tempo: 120*0.75, transp: 17+12),
    (tempo: 120*1.5, transp: 36+12)
  ]
);

~myCanon = ~convCanon.(~canonConfig);

~visualize.(~myCanon);


~myCanon
.canon //we extract the canon from the data structure that is returned
.collect(~instrument.([\distPad,\distpad2,\distPad2,\distPad3], amp: 1, repeat: 1)) // we pass each voice into our ~instrument. At this point ~instrument is returning a `MakePbind`, because it has been partially applied with `([Symbol], Amp, Repeat)`. This line will return: `[Pbind, Pbind, Pbind, Pbind]`
.do({|pbind| pbind.play});// finally we play each voice

)
/*
~makeConvVoices.(
	// tempos
	[1,2,3],
	// transposiciones
	[0,12,24],
	// amplitudes
	[1,1,1]

)
*/
