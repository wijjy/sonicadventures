use_bpm 60

use_synth :piano

use_random_seed 1002

hissrate = sample_duration(:vinyl_hiss)/8.0
live_loop :sweep do
#  stop
  sample :vinyl_hiss, rate: hissrate, amp: 0.5, attack: 2, sustain: 6,release: 2
  sleep 8
end



live_loop :low do
  sync :bassloop
  play choose([:e1, :g1, :b1]), sustain: 4, amp: 0.3
  sleep 1
  play choose([:e1, :g1, :b1]), sustain: 4, amp: 0.2 if one_in(2)
  sleep 1
  play choose([:e1, :g1, :b1]), sustain: 4, amp: 0.3# if one_in(2)
  sleep 1
  play choose([:e1, :g1, :b1]), sustain: 4, amp: 0.3 if one_in(2)
  sleep 2
end

drag =0.06




with_fx :reverb do
live_loop :mybreaks do
4.times do
sleep drag
sample :drum_cymbal_closed, amp: 0.2
  sample :drum_snare_soft, amp: 0.2
  sleep 1
  sample :drum_snare_soft, amp: 0.14 if one_in(2)
  sleep 1
  sample :drum_cymbal_closed, amp: 0.2
#  sample :drum_snare_soft, amp: 0.2
sleep 0.05
 sample :drum_cymbal_closed, amp: 0.2 
  sleep 0.45
sleep 0.5
  sample :drum_snare_soft, amp: 0.15 if one_in(2)
  sleep 1-drag
end
end
  #  with_fx :echo, phase: 0.0625 do
  live_loop :mychords do
      cue :bassloop
    4.times do

      play chord(:E3, :minor7),sustain: 4
      sleep 0.125
      play chord(:E3, :m11),sustain: 4 if one_in(3)
      sleep 0.375
      play :b3 if one_in(2)
      sleep 0.25
      play :b3 if one_in(2)
      sleep 0.25
      play choose([chord(:D3, :major),
                   chord(:E3, :minor),
                   chord(:B3, :minor7)]), sustain: 2
      sleep 0.5
      play :e3
      play :b3 if one_in(2)
      sleep 0.5
      play chord(:E3, :m7)
      sleep 0.125
      play chord(:E3, :m11) if one_in(3)
      sleep 0.375
      play :g4 if one_in(2)
      sleep 0.125
      play :g3 if one_in(3)
      sleep 0.125
      play :e4 if one_in(2)
      sleep 0.125
      play :e3 if one_in(3)
      sleep 0.125
      play choose([chord(:A3, :minor),
                   chord(:C3, :major),
                   chord(:d3, :major)])
      sleep 0.5
      play :e4 if one_in(2)
      sleep 0.5
    end
    #  end
  end
end
