# Welcome to Sonic Pi
#reggae start


use_bpm 140


define :intro do
  sample :drum_bass_soft
  sample :drum_cymbal_open
  sleep 0.5
  sample :drum_tom_hi_soft
  sleep 0.25
  sample :drum_tom_hi_soft, amp: 0.7
  sleep 0.25
  sample :drum_tom_hi_soft, amp: 0.5
  sleep 0.5
  
  sample :drum_tom_mid_soft, amp: 0.7
  sleep 0.5
  sample :drum_tom_lo_soft, amp: 0.5
  sample :drum_bass_soft
  sleep 0.25
  sample :drum_tom_lo_soft, amp: 0.7
  sleep 0.25
  sample :drum_tom_lo_soft, amp: 1
  sleep 0.5
  sample :drum_snare_soft
  sample :drum_splash_soft
end
##############################################################################

intro

live_loop :main, delay: 2 do
  offset = 0.03
  one_drop1 offset
  one_drop2 offset
  one_drop1 offset
  one_drop4 offset
  one_drop1 offset
  one_drop2 offset
  one_drop1 offset
  one_drop8 offset
end

quarter=0.25
eighth = 0.125
sixteenth = eighth/2

define :bar3 do
  # beat 1
  sleep 1-eighth
  bubble :e4 # beat 2
  sleep 1 - eighth
  # beat 3
  sleep 1- eighth
  play chord(:e3, :minor)
  sleep eighth
  play chord(:e4, :minor)
  sleep sixteenth
  play chord(:e3, :minor)
  sleep eighth
  play chord(:e4, :minor)
  sleep sixteenth
  play chord(:e3, :minor)
  sleep eighth
  play chord(:e4, :minor)
  sleep eighth
end


with_synth :prophet do
  live_loop :piano, delay: 2 do
    bar1
    bar2
    bar1
    bar2
    bar1
    bar2
    bar1
    bar2
  end
end# Welcome to Sonic Pi

bass_sample = :bass_hit_c

bass_notes1 = [:r, :A2, :A2, :A2, :E2, :C2, :E2, :E2, :B2]
bass_timings = [1, 1, 0.5, 0.5, 0.5, 0.5, 1, 1, 2]
bass_notes2 = [:r, :A2, :A2, :A2, :E2, :C2, :E2, :E2, :B2, :B2]
bass_timings = [1, 1, 0.5, 0.5, 0.5, 0.5, 1, 1, 1, 1]
bass_notes4 =   [:r, :A2, :A2, :A2, :E2, :C2, :D2,  :E2, :E2, :B2, :B2]
bass_timings4 = [ 1,   1, 0.5, 0.5, 0.5, 0.5,  0.5, 0.5,   1,   1,   1]

with_fx :reverb  do
  with_synth :beep do
    live_loop :bass2, delay: 2 do
      play_pattern_timed bass_notes1, bass_timings, decay: 0.1, attack: 0.1, release: 0.5
      play_pattern_timed bass_notes2, bass_timings, decay: 0.1, attack: 0.1, release: 0.5
      play_pattern_timed bass_notes1, bass_timings, decay: 0.1, attack: 0.1, release: 0.5
      play_pattern_timed bass_notes4, bass_timings, decay: 0.1, attack: 0.1, release: 0.5
      
    end
  end
end


###################################################################################

define :one_drop do |off|
  sample :drum_cymbal_closed  #1
  sample :drum_bass_soft
  sleep 0.5+off
  sample :drum_cymbal_closed
  sleep 0.5-off
  sample :drum_cymbal_closed  #2
  sleep 0.5+off
  sample :drum_cymbal_closed
  sleep 0.5-off
  sample :drum_cymbal_closed   #3
  sample :drum_bass_soft
  sample :drum_snare_soft
  sleep 0.5+off
  sample :drum_cymbal_closed
  sleep 0.5-off
  sample :drum_cymbal_closed   #4
  sleep 0.5+off
  sample :drum_cymbal_closed
  sample :drum_bass_soft
  sleep 0.5-off
  sample :drum_cymbal_closed  #1
  sample :drum_bass_soft
  sleep 0.5+off
  sample :drum_cymbal_closed
  sleep 0.5-off
  sample :drum_cymbal_closed  #2
  sleep 0.5+off
  sample :drum_cymbal_closed
  sleep 0.5-off
  sample :drum_cymbal_closed   #3
  sample :drum_bass_soft
  sample :drum_snare_soft
  sleep 0.5+off
  sample :drum_cymbal_closed
  sleep 0.5-off
  sample :drum_cymbal_closed   #4
  sample :drum_bass_soft
  sleep 0.5+off
  sample :drum_cymbal_closed
  sleep 0.5-off
end


define :one_drop1 do |off|
  sample :drum_cymbal_closed  #1
  sample :drum_bass_soft
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed  #2
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed   #3
  sample :drum_bass_soft
  sample :drum_snare_soft
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed   #4
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_bass_soft
  sleep 0.5-off
end

define :one_drop2 do |off|
  sample :drum_bass_soft    #1
  sample :drum_cymbal_closed
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed   #2
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed   #3
  sample :drum_bass_soft
  sample :drum_snare_soft
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed  #4
  sample :drum_bass_soft
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5   #4
  sleep 0.5-off
end

define :one_drop4 do |off|
  sample :drum_bass_soft    #1
  sample :drum_cymbal_closed
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed   #2
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_bass_soft
  sleep 0.5-off
  sample :drum_cymbal_open   #3
  sample :drum_bass_soft
  sample :drum_snare_soft
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed  #4
  sample :drum_bass_soft
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5   #4
  sleep 0.5-off
end

define :one_drop8 do |off|
  sample :drum_bass_soft    #1
  sample :drum_cymbal_closed
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_snare_soft
  sleep 0.5-off
  sample :drum_cymbal_closed   #2
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sample :drum_bass_soft
  sleep 0.5-off
  sample :drum_cymbal_open   #3
  sample :drum_bass_soft
  sample :drum_snare_soft
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5
  sleep 0.5-off
  sample :drum_cymbal_closed  #4
  sample :drum_bass_soft
  sleep 0.5+off
  sample :drum_cymbal_closed, amp: 0.5   #4
  sleep 0.5-off
end
#-----------------------------------------------------------------

define :bubble do |note|
  play chord(note-12, :minor)
  sleep eighth
  play chord(note, :minor)
  sleep eighth
  play chord(note-12, :minor)
end


define :bar1 do
  sleep 1 - eighth
  bubble :a4   # beat 2
  sleep 1 - eighth
  # beat 3
  sleep 1-eighth
  bubble :a4 # beat 4
  sleep 1-eighth
end

define :bar2 do
  sleep 1 - eighth
  bubble :e4     # beat 2
  sleep 1 - eighth
  # beat 3
  sleep 1 - eighth
  bubble :e4      # beat 4
  sleep 1 - eighth
end
#------------------------------------------------------------------------
