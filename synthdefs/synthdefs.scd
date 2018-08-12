SynthDef(\dist, {
|freq=1.0, decayTime=0.5, amp=0.75, temp=100, out=0, done=2, pan=0, att=0.001, sus=0.05, rel=0.6|

	var sig, env;

	sig = RLPF.ar(WhiteNoise.ar(LFNoise2.kr(3,3,100)).tanh,freq*4,0.01)/2;

	sig = RLPF.ar(sig + ( LFSaw.ar(freq) * 3333.33 ).tanh, freq, 0.95 ).tanh / 2;

	env = EnvGen.kr( Env.perc(att,rel), doneAction: 2 );

	sig = sig * env;

	Out.ar( out, sig );

}).store;
SynthDef(\dist3, {
|freq=1.0, decayTime=0.5, amp=0.75, temp=100, out=0, done=2, pan=0, att=0.001, sus=0.05, rel=0.6|

	var sig, env;

	sig = RLPF.ar(WhiteNoise.ar(LFNoise2.kr(8,3,300)).tanh,freq*4,0.005)/2;

	sig = RLPF.ar(sig + ( LFSaw.ar(freq) * 3333.33 ).tanh, freq, 0.95 ).tanh / 2;

	env = EnvGen.kr( Env.perc(att,rel), doneAction: 2 );

	sig = sig * env;

	Out.ar( out, sig );

}).store;
SynthDef(\dist2, {
|freq=1.0, decayTime=0.5, amp=0.75, temp=100, out=0, done=2, pan=0, att=0.001, sus=0.05, rel=1.8|

	var sig, env;

	sig = RLPF.ar(WhiteNoise.ar(LFNoise2.kr(3,3,100)).tanh,freq*[4,6],0.01)/2;

	sig = RLPF.ar(sig + ( LFSaw.ar(freq) * 1.33 ).tanh, freq, 0.25 ).tanh / 4;

	env = EnvGen.kr( Env.perc(att,rel), doneAction: 2 );

	sig = sig * env;

	Out.ar( out, sig / 2 );

}).store;


SynthDef(\distPad, {
|freq=1.0, decayTime=0.5, amp=0.75, temp=100, out=0, done=2, pan=0, att=1.5, sus=0.1, rel=3.5|

	var sig, env;

	sig = RLPF.ar(WhiteNoise.ar(LFNoise2.kr(3,3,100)).tanh,freq*4,0.05)/2;

	sig = RLPF.ar(sig + ( LFSaw.ar(freq) * 33.33 ).tanh, freq*2, 0.35 ).tanh / 4;

	env = EnvGen.kr( Env.perc(att,rel), doneAction: 2 );

	sig = sig * env;

	Out.ar( out, sig );

}).store;

SynthDef(\distPad2, {
|freq=1.0, decayTime=0.5, amp=0.75, temp=100, out=0, done=2, pan=0, att=1.5, sus=0.1, rel=3.5|

	var sig, env;

	sig = RLPF.ar(WhiteNoise.ar(LFNoise2.kr(3,3,100)).tanh,freq*8,0.05)/2;

	sig = RLPF.ar(( (sig + LFSaw.ar(freq)) * 333.33 ).tanh, freq, 0.05 );

	sig = (sig*1.3).tanh / 3;

	env = EnvGen.kr( Env.perc(att,rel), doneAction: 2 );

	sig = sig * env;

	Out.ar( out, sig );

}).store;

SynthDef(\distPad3, {
|freq=1.0, decayTime=0.5, amp=0.75, temp=100, out=0, done=2, pan=0, att=1.5, sus=0.1, rel=3.5|

	var sig, env;

	sig = RLPF.ar(WhiteNoise.ar(LFNoise2.kr(3,3,100)).tanh,freq*4,0.05)/2;

	sig = RLPF.ar(
		(sig + LFSaw.ar(freq/4)),
		freq, 0.05
	);

	sig = (sig * 1.33).tanh / 4;
	env = EnvGen.kr( Env.perc(att,rel), doneAction: 2 );

	sig = sig * env;

	Out.ar( out, sig );

}).store;

SynthDef(\tranceBazz, {
|freq=1.0, decayTime=0.5, amp=0.75, temp=100, out=0, done=2, pan=0, att=0.01, sus=0.1, rel=0.2|

	var sig, env;

	sig = SinOsc.ar(freq)/4;
	sig = sig + Saw.ar(freq/4)/2;
	sig = (sig * 23.33).tanh;
	sig = RLPF.ar(sig,freq*[1,4],0.06);
	// sig = (sig * 23.33).tanh;

	env = EnvGen.kr( Env.perc(att,rel), doneAction: 2 );

	sig = sig * env;

	Out.ar( out, sig );

}).store;


SynthDef(\tranceBazz2, {
|freq=1.0, decayTime=0.5, amp=0.75, temp=100, out=0, done=2, pan=0, att=0.01, sus=0.1, rel=0.2|

	var sig, env;

	sig = SinOsc.ar(freq/2)/4;
	sig = sig + Saw.ar(freq/4)/2;
	sig = RLPF.ar(sig,freq*[1,4],0.06);
	sig = (sig * 23.33).tanh;
	// sig = (sig * 23.33).tanh;

	env = EnvGen.kr( Env.perc(att,rel), doneAction: 2 );

	sig = sig * env;

	Out.ar( out, sig );

}).store;

SynthDef(\silent, {


	Out.ar( 0, Silent.ar );

}).store;
