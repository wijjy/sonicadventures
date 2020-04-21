# Welcome to Sonic Pi



live_loop :bluethunder do
  with_fx :echo, phase: 1 do
    sample "D:/Samples/bluethunder.wav" ,rate: 1, amp: 1.0
  end
  sleep 4
end

live_loop :beat do
  sample :drum_snare_soft ,rate: 0.5, amp: 0.2
  sleep 0.1
  sample :drum_snare_soft ,rate: 0.1, amp: 0.2
  sleep 0.9
  sample :drum_snare_soft ,rate: 0.5, amp: 0.6
  sleep 0.1
  sample :drum_snare_soft ,rate: 0.1, amp: 0.2
  sleep 0.9
  sample :drum_snare_soft, rate: 0.5, amp: 0.6
  sleep 0.1
  sample :drum_snare_soft, rate: 0.1, amp: 0.2
  sleep 0.9
  sample :drum_snare_soft, rate: 0.5, amp: 0.6
  sleep 0.1
  sample :drum_snare_soft, rate: 0.1, amp: 0.2
  sleep 0.9
  sample :drum_snare_soft, rate: 0.5, amp: 0.6
end

live_loop :minorchords do
  use_synth :blade
  sync :bluethunder
  play chord(:g2, :minor), release: 0.2
  sleep 0.5
  play chord(:g2, :minor), release: 0.2
  sleep 0.5
  play chord(:d3, :minor), release: 0.4
  sleep 1
  play chord(:e3, :minor), release: 0.2
  sleep 0.5
  play chord(:e3, :minor), release: 0.2
  sleep 1.5
end