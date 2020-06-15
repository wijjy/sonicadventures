use_bpm 120


whoosh_dur = sample_duration(:ambi_dark_woosh)

ra = 0.1

live_loop :whoosh do
  if ra > 0.3
    4.times do
      sleep 4
    end
  else
    wamp = rrand(1,3)
    4.times do
      sample :ambi_dark_woosh, rate: 4.0/whoosh_dur, amp: wamp
      sleep 4
    end
  end
  ra= rand(1)
end

live_loop :loop1, delay: 24 do
  use_synth choose([:mod_fm, :fm,  :blade, :prophet, :fm, :mod_fm])
  use_synth_defaults release: rrand(0.1, 0.3),
    amp: 1.2, pan: rrand(-0.5, 0.5)
  16.times do
    with_fx :bitcrusher, mix: 0.5 do
      with_fx :echo, mix: 0.6 do
        play chord(:e3, :minor)
        sleep 0.5
        play :d3
        sleep 0.25
        play :cs3 if one_in(2)
        sleep 0.25
        play chord(:a3, :minor)
        sleep 0.25
        play chord(:a3, :minor7)
        sleep 0.5
        play :d3
        sleep 0.25
        play chord(:c3, :maj11)
        sleep 0.5
        play chord(:c4, :major)
        sleep 0.5
        play chord(:d3, :major)
        sleep 0.5
        play chord(:d4, :major) if one_in(2)
        sleep 0.5
      end
    end
  end
end

live_loop :high, delay: 16 do
  with_synth :piano do
    with_fx :reverb, room: 0.8, damp: 1 do
      if one_in(2)
        r = rand(1)
        4.times do
          play chord(:e5, :minor), amp: 2.4
          sleep 0.25
          play chord(:e5, :minor), amp: 2.4 if r<0.5
          sleep 1.75
          play chord(:a5, :minor), amp: 1.5
          sleep 0.25
          play chord(:a5, :minor), amp: 1.5 if r<0.5
          sleep 0.75
          play chord(:b5, :minor)
          sleep 0.333
          play chord(:b5, :minor7) if r < 0.67
          sleep 0.333
          play chord(:b5, :minor7) if r< 0.67
          sleep  0.334
        end
        2.times do
          play chord(:e6, :minor), amp: 2.4
          sleep 0.25
          play chord(:e6, :minor), amp: 2.4 if r<0.5
          sleep 1.75
          play chord(:a6, :minor), amp: 1.9
          sleep 0.25
          play chord(:a6, :minor), amp: 1.1 if r<0.5
          sleep 0.75
          play chord(:b6, :minor)
          sleep 0.333
          play chord(:b5, :minor), amp: 0.8 if r < 1
          sleep 0.333
          play chord(:b6, :minor), amp: 0.8 if r< 1
          sleep  0.334
        end
        2.times do
          play chord(:e5, :minor), amp: 2.4
          sleep 0.25
          play chord(:e5, :minor), amp: 2.4 if r<0.5
          sleep 1.75
          play chord(:a5, :minor), amp: 1.5
          sleep 0.25
          play chord(:a5, :minor), amp: 1.5 if r<0.5
          sleep 0.75
          play chord(:b5, :minor)
          sleep 0.333
          play chord(:b5, :minor) if r < 0.5
          sleep 0.333
          play chord(:b5, :minor) if r< 0.5
          sleep  0.334
        end
      else
        sleep 8
      end
    end
  end
end


live_loop :drum_loop1, delay: 8 do
  sample :drum_bass_soft
  sleep 0.5
  sample :drum_heavy_kick
  sleep 0.25
  sample :drum_heavy_kick if one_in(1.5)
  sleep 0.25
  sample :drum_bass_soft
  sleep 1
  sample :drum_bass_soft
  sample :drum_heavy_kick
  sleep 1
  sample :drum_bass_hard, amp: 1.6
  sleep 0.25
  sample :drum_bass_hard
  sleep 0.25
  sleep 0.5
end


live_loop :drum_loop2, delay: 4 do
  4.times do
    sample :drum_snare_soft
    sleep 0.1
    sample :drum_snare_soft
    sleep 0.4
    sample :drum_snare_soft if one_in(3)
    sleep 0.5
    ## beat 2
    sample :drum_snare_soft if one_in(3)
    sleep 0.5
    sample :drum_snare_soft
    sleep 0.5
    ## beat 3
    sample :drum_snare_soft if one_in(3)
    sleep 0.1
    sample :drum_snare_soft
    sleep 0.4
    sample :drum_snare_soft
    sleep 0.5
    ## beat 4
    sample :drum_snare_soft
    sleep 0.5
    sample :drum_snare_soft  if one_in(2)
    sleep 0.5
  end
end

e=0.5
h=4

live_loop :bs_riff, delay: 4 do
  use_synth :beep
  r2 = rand(1)
  play_pattern_timed [:e2,:e2,:g2,:e2,:e2,:a2,:a2,:a2],
    [e,e,e,e,e,e,e,e]
  play_pattern_timed [:e2,:e2,:g2,:e2,:e2,:a2,:a2,:g2],
    [e,e,e,e,e,e,e,e]
  play_pattern_timed [:e2,:e2,:g2,:e2,:e2,:a2,:a2,:a2],
    [e,e,e,e,e,e,e,e]
  play_pattern_timed [:e2,:e2,:g2,:e2,:e2,:a2,:a2,:b2],
    [e,e,e,e,e,e,e,e] if r2 < 0.5
  play_pattern_timed [:e2,:e2,:g2,:e2,:r],
    [e,e,e,e,h] if r2 > 0.5
  play_pattern_timed [:e2,:e2,:g2,:e2,:e2,:a2,:a2,:a2],
    [e,e,e,e,e,e,e,e]
  play_pattern_timed [:e2,:e2,:g2,:e2,:e2,:a2,:a2,:g2],
    [e,e,e,e,e,e,e,e]
  play_pattern_timed [:e2,:e2,:g2,:e2,:e2,:a2,:a2,:a2],
    [e,e,e,e,e,e,e,e]
  play_pattern_timed [:e2,:e2,:g2,:e2,:r],[e,e,e,e,h]
end


