
live_loop :hihat_loop do
  divisors = ring 2, 3, 1 ,2 ,2 ,6, 1, 3
  divisors.tick.times do
    sample :drum_tom_mid_soft, amp: 1 if one_in(2)
    sleep 1.0 / divisors.look
  end
end

live_loop :snare do
  sdivisors = ring 2, 2, 4, 2, 1, 2, 6, 6
  sdivisors.tick.times do
    sample :drum_snare_soft, amp: 0.8
    sleep 1.0 / sdivisors.look
  end
end



live_loop :bd do
  sdivisors = ring 1, 1, 2, 1, 1, 1, 2, 1
  sdivisors.tick.times do
    sample :drum_bass_soft, amp: 1
    sleep 1.0 / sdivisors.look
  end
end