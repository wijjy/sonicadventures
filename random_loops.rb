#random loops


#1000 works.
#1999

live_loop :multi_beat do
  use_random_seed 1999
  #sample :bass_hit_c
  8.times do
    c = rrand(70, 130)
    n = (scale :d1, :minor_pentatonic).take(3).choose
    synth :tb303, note: n, release: 0.1, cutoff: c if rand < 0.9
    sample :elec_hi_snare if one_in(6)
    sample :drum_cymbal_closed if one_in(2)
    sample :drum_cymbal_pedal if one_in(3)
    sample :bd_haus if one_in(4)
    sleep 0.125
  end
end

