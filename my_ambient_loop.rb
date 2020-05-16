

live_loop :go do
  sample :ambi_swoosh, amp: choose([0.2, 0.5])
  sample :drum_bass_soft, amp: 0.3
  sleep 0.08
  #  sample :drum_bass_soft, amp: 0.2
  #  sleep 0.08
  with_fx :wobble do
    sample :drum_bass_soft, amp: 0.2
    with_fx :reverb do
      with_fx :echo, phase: 0.125 do
        with_synth :beep do
          play chord(:e3, :minor),
            amp: choose([0.2, 0.1, 0.3]),
            attack: 0.5,
            release: 2
        end
        sleep 0.5
        sample :elec_plip,
          amp: 0.3
        sleep 0.5
        play choose([:e4, :b4, [:e4, :g4, :b4]]),
          amp: choose([0.2, 0.1, 0.25])
      end
    end
  end
  sleep 2
end